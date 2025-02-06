@extends('ecommerce::frontend.layout.main')

@section('title') @if($category->page_title) {{$category->page_title}} @else {{ $ecommerce_setting->site_title ?? '' }} @endif @endsection

@section('description') @if($category->short_description) {{$category->short_description}} @else  @endif @endsection

@section('content')
    <!--Breadcrumb Area start-->
    <div class="breadcrumb-section">
        <div class="container">
            <div class="row">
                <div class="col">
                    <h1 class="page-title">{{ $category->name }}</h1>
                    <ul>
                        <li><a href="{{ url('/') }}">Home</a></li>
                        <li class="active">{{ $category->name }}</li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--Breadcrumb Area ends-->
    <!--Shop cart starts-->
    <section class="shop-cart-section">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3">
                    @php
                        $uniqueVariants = [];

                        foreach ($variants as $variant) {
                            $options = json_decode($variant->variant_option, true);
                            $values = json_decode($variant->variant_value, true);

                            if (is_array($options) && is_array($values)) {
                                foreach ($options as $index => $option) {
                                    // Ensure both arrays have the key and add to the unique array
                                    if (isset($values[$index])) {
                                        if (!isset($uniqueVariants[$option])) {
                                            $uniqueVariants[$option] = [];
                                        }

                                        // Merge unique values
                                        $uniqueVariants[$option] = array_unique(array_merge($uniqueVariants[$option], explode(',', $values[$index])));
                                    }
                                }
                            }
                        }
                    @endphp

                    @foreach ($uniqueVariants as $variantType => $options)
                        <div class="variant-section mb-3">
                            <h5>{{ $variantType }}</h5>
                            @foreach ($options as $option)
                                <label data-v-option="{{ $variantType }}" data-v-value="{{ $option }}"
                                       class="form-check-label" for="{{ $variantType }}_{{ $option }}">
                                    {{ $option }}
                                </label>
                            @endforeach
                        </div>
                    @endforeach

                    <style>
                        /* Style adjustments for checkboxes to display them in a grid */
                        .variant-section h5 {
                            font-size: 1.2rem;
                            font-weight: bold;
                        }

                        .form-check-label {
                            border: 1px solid #ddd;
                            border-radius: 0;
                            margin: 0 10px 10px 0;
                            padding: 5px 10px;
                        }

                        .form-check-label:hover {
                            border: 1px solid #333;
                        }
                    </style>

                </div>
                <div class="col-md-9 product-grid">
                    @foreach($products as $product)
                        @include('ecommerce::frontend.includes.product-template')
                    @endforeach

                    @if(count($products) == 0)
                        <h3 class="text-center mt-5 mb-5 d-block w-100">Sorry, no products found</h3>
                    @endif


{{--                    @if(count($products) > 10 )--}}
{{--                        {{ $products->links() }}--}}

{{--                    @endif--}}
                </div>
            </div>
        </div>
    </section>
    <!--Shop cart ends-->
@endsection

@section('script')
    <script type="text/javascript">
        "use strict";

        $(document).on('click', '.add-to-cart', function (e) {
            e.preventDefault();
            var id = $(this).data('id');
            var parent = '#add_to_cart_' + id;

            var qty = $(parent + " input[name=qty]").val();

            var route = "{{ route('addToCart') }}";

            $.ajax({
                url: route,
                type: "POST",
                data: {
                    product_id: id,
                    qty: qty,
                },
                success: function (response) {
                    console.log(response);
                    if (response) {
                        $('.alert').addClass('alert-custom show');
                        $('.alert-custom .message').html(response.success);
                        $('.cart__menu .cart_qty').html(response.total_qty);
                        $('.cart__menu .total').html('{{$currency->symbol ?? $currency->code}}' + response.subTotal.toFixed(2));

                        setTimeout(function () {
                            $('.alert').removeClass('show');
                        }, 4000);
                    }
                },
            });
        })

        // Load more
        var page_num = 1;
        var total_page = <?php echo json_encode($products->total()) ?>;
        $(window).scroll(function () {
            if (($(window).scrollTop() + $(window).height() > ($(document).height() * (2 / 3))) && (total_page >= page_num)) {
                loadMoreData(++page_num);
            }

        });

        function loadMoreData(page_num) {
            $.ajax({
                url: '?page=' + page_num,
                type: "get",
            }).done(function (data) {
                $(".product-grid").append(data.html);
                $('.product-img').each(function () {
                    var img = $(this).data('src');
                    $(this).attr('src', img);
                })
            }).fail(function (jqXHR, ajaxOptions, thrownError) {
                console.log('server not responding...');
            });
        }

        $(document).on('click', '.form-check-label', function () {
            // Get the data attributes from the clicked label
            var option = $(this).data('v-option'); // e.g., "Size" or "Color"
            var value = $(this).data('v-value').toString(); // Convert to string for consistent comparison

            // Get the current URL
            var currentUrl = new URL(window.location.href);

            // Get the existing values for this option in the URL, if any
            var existingValues = currentUrl.searchParams.get(option);

            // Initialize an array of values
            var valuesArray = existingValues ? existingValues.split(',').map(v => v.trim()) : [];

            // Add or remove the clicked value
            if (valuesArray.includes(value)) {
                // If the value is already in the array, remove it
                valuesArray = valuesArray.filter(v => v !== value);
            } else {
                // Otherwise, add it to the array
                valuesArray.push(value);
            }

            // Update the URL parameter with the modified values
            if (valuesArray.length > 0) {
                currentUrl.searchParams.set(option, valuesArray.join(',')); // Join without duplicates
            } else {
                // Remove the parameter if no values are selected
                currentUrl.searchParams.delete(option);
            }

            // Redirect to the updated URL
            window.location.href = decodeURIComponent(currentUrl.toString());
        });

    </script>
@endsection
