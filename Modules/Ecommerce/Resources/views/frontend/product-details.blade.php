@extends('ecommerce::frontend.layout.main')

@if($product->image!==null)
    @php
        $images = explode(',', $product->image);
        $product->image = $images[0];
    @endphp
@endif

@section('title'){{ $product->meta_title ?? $product->name }}@endsection

@section('description'){{ $product->meta_description ?? $product->name }}@endsection

@section('image'){{ url('images/product/large') }}/{{$product->image}}@endsection

@section('brand'){{ $brand->title ?? '' }}@endsection

@section('stock')@if($product->qty > 0){{'in stock'}} @else {{'out of stock'}}@endif @endsection

@section('price')@if(!empty($product->promotion_price)){{ $product->promotion_price }}@else{{ $product->price }}@endif @endsection

@section('id'){{ $product->id }}@endsection

@section('category_id'){{ $product->category_id }}@endsection


@push('css')
    <style>
        li {
            font-size: 14px
        }

        .slick-list, .slick-slider, .slick-track {
            position: relative;
            display: block
        }

        .slick-loading .slick-slide, .slick-loading .slick-track {
            visibility: hidden
        }

        .slick-slider {
            box-sizing: border-box;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            -webkit-touch-callout: none;
            -khtml-user-select: none;
            -ms-touch-action: pan-y;
            touch-action: pan-y;
            -webkit-tap-highlight-color: transparent
        }

        .slick-list {
            overflow: hidden;
            margin: 0;
            padding: 0
        }

        .slick-list:focus {
            outline: 0
        }

        .slick-list.dragging {
            cursor: pointer;
            cursor: hand
        }

        .slick-slider .slick-list, .slick-slider .slick-track {
            -webkit-transform: translate3d(0, 0, 0);
            -moz-transform: translate3d(0, 0, 0);
            -ms-transform: translate3d(0, 0, 0);
            -o-transform: translate3d(0, 0, 0);
            transform: translate3d(0, 0, 0)
        }

        .slick-track:after, .slick-track:before {
            display: table;
            content: ''
        }

        .slick-track:after {
            clear: both
        }

        .slick-slide {
            display: none;
            float: left;
            height: 100%;
            min-height: 1px
        }

        [dir=rtl] .slick-slide {
            float: right
        }

        .slick-initialized .slick-slide, .slick-slide img {
            display: block
        }

        .slick-arrow.slick-hidden, .slick-slide.slick-loading img {
            display: none
        }

        .slick-slide.dragging img {
            pointer-events: none
        }

        .slick-vertical .slick-slide {
            display: block;
            height: auto;
            border: 1px solid transparent
        }

        .slider-for__item img {
            width: 100%
        }

        .slider-for {
            overflow: hidden;
            width: 100%
        }

        .slider-nav {
            margin-top: 15px;
            width: 100%
        }

        .slick-track {
            top: 0;
            left: 0;
            display: flex;
            justify-content: center
        }

        .slider-nav__item {
            width: 100px !important
        }

        .slider-nav__item.slick-slide {
            border: 1px solid #f5f6f7;
            border-radius: 5px;
            margin: 3px;
            padding: 10px
        }

        .slider-nav__item.slick-slide.slick-current {
            border: 1px solid #333
        }

        .slider-nav__item.slick-slide.slick-active img {
            opacity: .3;
            cursor: pointer
        }

        .slider-nav__item.slick-slide.slick-current.slick-active img {
            opacity: 1;
            cursor: pointer
        }

        .product-details-section .slider-nav__item.slick-slide {
            border: 1px solid transparent;
            padding: 5px
        }

        .variant_val {
            border: 1px solid #ddd;
            cursor: pointer;
            padding: 5px;
            min-width: 40px;
            height: 40px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .variant_val.selected {
            border: 2px solid var(--theme-color);
            padding: 5px
        }

        .slick-dots, .slick-next, .slick-prev {
            display: none !important
        }

        label {
            color: #111;
            font-size: 14px;
            padding-top: 5px;
        }
    </style>
@endpush

@section('content')
    <!--Product details section starts-->
    <section class="product-details-section">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-5 mt-5">
                    @if(($product->promotion == 1) && (($product->last_date > date('Y-m-d')) || !isset($product->last_date)))
                        <div class="product-promo-text style1 bg-danger">
                            <span>-{{ round(($product->price - $product->promotion_price) / $product->price * 100) }}%</span>
                        </div>
                    @endif
                    @if(isset($images))
                        <div class="slider-wrapper">
                            <div class="slider-for">
                                @foreach($images as $image)
                                    @if(file_exists(url("images/product/xlarge")))
                                        <div class="slider-for__item ex1"
                                             data-src="{{ url('images/product/xlarge') }}/{{$image}}">
                                            <img src="{{ url('images/product/xlarge') }}/{{$image}}"
                                                 alt="{{ $product->name }}"/>
                                        </div>
                                    @else
                                        <div class="slider-for__item ex1"
                                             data-src="{{ url('images/product/large') }}/{{$image}}">
                                            <img src="{{ url('images/product/large') }}/{{$image}}"
                                                 alt="{{ $product->name }}"/>
                                        </div>
                                    @endif
                                @endforeach
                            </div>
                            <div class="slider-nav">
                                @foreach($images as $image)
                                    <div class="slider-nav__item">
                                        <img src="{{ url('images/product/large') }}/{{$image}}"
                                             alt="{{ $product->name }}"/>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    @else
                        <img src="https://placehold.co/550x550" alt="{{ $product->name }}"/>
                    @endif
                </div>
                <div class="col-md-6 offset-md-1 mt-5">
                    <a class="theme-color" href="{{url('/shop')}}/{{$category->slug}}">{{$category->name}}</a>
                    <h1 class="item-name">{!! $product->name !!}</h1>
                    <div class="item-price mb-3">
                        @if(($product->promotion == 1) && (($product->last_date > date('Y-m-d')) || !isset($product->last_date)))
                            <span
                                class="price">{{$currency->symbol ?? $currency->code}} <span
                                    class="price2"> {{ $product->price }}</span></span>
                            <span class="old-price">{{$currency->symbol ?? $currency->code}} <span
                                    class="price2">{{ $product->price }} </span></span>
                        @else
                            <span class="price">{{$currency->symbol ?? $currency->code}} <span
                                    class="price2">{{ $product->price }}</span></span>
                        @endif
                    </div>
                    @if(isset($product->short_description) && strlen($product->short_description) > 0)
                        <div class="mt-5 mb-5">
                            <div class="item-short-description">
                                {!! $product->short_description !!}
                            </div>
                        </div>
                    @endif
                    <div class="item-options mb-5">
                        @if($product->variant_option)
                            <div class="row" id="variant-input-section">
                                @php
                                    $count_var_val = 0;
                                @endphp
                                @foreach($product->variant_option as $key => $variant_option)
                                    @php
                                        $count_var_val += count(explode(",", $product->variant_value[$key]));
                                    @endphp
                                    <div class="col-md-2 form-group mt-2">
                                        <label>{{$product->variant_option[$key]}}</label>
                                    </div>
                                    <div class="col-md-10 form-group mt-2">
                                        @php
                                            $val_list = explode(',',$product->variant_value[$key]);
                                        @endphp
                                        <ul class="d-flex">
                                            @foreach($val_list as $val)
                                                <li class="ml-3 variant_val"
                                                    onclick="reloadData({{$val}},{{ $product->price }})">{{$val}}</li>
                                            @endforeach
                                        </ul>
                                    </div>
                                @endforeach
                            </div>
                        @endif
                        @if($product->in_stock == 1)
                            <form method="post" id="add_to_cart_{{ $product->id }}" class="mt-3 mb-3 d-flex">
                                @csrf
                                <div class="input-qty">
                                    <button type="button" class="quantity-left-minus">
                                        <i class="material-symbols-outlined">remove</i>
                                    </button>
                                    <input type="number" name="qty" class="input-number" value="1" min="1" max="100">
                                    <button type="button" class="quantity-right-plus">
                                        <i class="material-symbols-outlined">add</i>
                                    </button>
                                </div>
                                <button data-id="{{ $product->id }}"
                                        class="button @if($ecommerce_setting->theme == 'fashion') style2 lg @else style1 @endif add-to-cart"
                                        @if($product->is_variant == 1) disabled="true" @endif>
                                    <span class="material-symbols-outlined mr-2">shopping_bag</span>
                                    {{trans('file.Add to cart')}}
                                </button>
                            </form>
                        @else
                            @if($product->qty > 0)
                                <form method="post" id="add_to_cart_{{ $product->id }}" class="mb-3 d-flex">
                                    @csrf
                                    <div class="input-qty">
                                        <button type="button" class="quantity-left-minus">
                                            <i class="material-symbols-outlined">remove</i>
                                        </button>
                                        <input type="number" name="qty" class="input-number" value="1" min="1"
                                               max="{{ $product->qty }}">
                                        <button type="button" class="quantity-right-plus">
                                            <i class="material-symbols-outlined">add</i>
                                        </button>
                                    </div>
                                    <button data-id="{{ $product->id }}"
                                            class="button @if($ecommerce_setting->theme == 'fashion') style2 lg @else style1 @endif add-to-cart"
                                            >
                                        <span class="material-symbols-outlined mr-2">shopping_bag</span>
                                        {{trans('file.Add to cart')}}
                                    </button>
                                </form>
                            @else
                                <span>{{trans('file.Out of stock')}}</span>
                            @endif
                        @endif
                    </div>
                    <hr>
                    <div class="mt-5">
                        <span class="d-inline-block">SKU </span>
                        <ul class="footer-social d-inline">
                            <li>:</li>
                            <li> {{$product->code}}</li>
                        </ul>
                        <br>
                    </div>
                    @if(isset($product->tags))
                        <div class="mt-2">
                            <span class="d-inline-block mt-3">{{trans('file.Tags')}} </span>
                            <ul class="footer-social d-inline">
                                <li>:</li>
                                <li> {{$product->tags}}</li>
                            </ul>
                        </div>
                    @endif
                    <div class="item-share mt-3">
                        <span>{{trans('file.Share')}}</span>
                        <ul class="footer-social d-inline pl-3 pr-3">
                            <li>
                                <a href="https://www.facebook.com/sharer/sharer.php?u={{url('/product')}}/{{$product->slug}}/{{$product->id}}"
                                   target="_blank">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="16" width="10"
                                         viewBox="0 0 320 512">
                                        <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                        <path
                                            d="M80 299.3V512H196V299.3h86.5l18-97.8H196V166.9c0-51.7 20.3-71.5 72.7-71.5c16.3 0 29.4 .4 37 1.2V7.9C291.4 4 256.4 0 236.2 0C129.3 0 80 50.5 80 159.4v42.1H14v97.8H80z"/>
                                    </svg>
                                </a>
                            </li>
                            <li>
                                <a href="https://twitter.com/intent/tweet?text={{ $product->meta_title ?? $product->name }}&url={{url('/product')}}/{{$product->slug}}/{{$product->id}}&via="
                                   target="_blank">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="16" width="16"
                                         viewBox="0 0 512 512">
                                        <!--!Font Awesome Free 6.5.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2024 Fonticons, Inc.-->
                                        <path
                                            d="M389.2 48h70.6L305.6 224.2 487 464H345L233.7 318.6 106.5 464H35.8L200.7 275.5 26.8 48H172.4L272.9 180.9 389.2 48zM364.4 421.8h39.1L151.1 88h-42L364.4 421.8z"/>
                                    </svg>
                                </a>
                            </li>
                            <li>
                                <a href="http://pinterest.com/pin/create/button/?url={{url('/product')}}/{{$product->slug}}/{{$product->id}}&media={{ url('images/product/large') }}/{{$product->image}}&description={{ $product->meta_title ?? $product->name }}"
                                   target="_blank">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-pinterest" viewBox="0 0 16 16">
                                        <path
                                            d="M8 0a8 8 0 0 0-2.915 15.452c-.07-.633-.134-1.606.027-2.297.146-.625.938-3.977.938-3.977s-.239-.479-.239-1.187c0-1.113.645-1.943 1.448-1.943.682 0 1.012.512 1.012 1.127 0 .686-.437 1.712-.663 2.663-.188.796.4 1.446 1.185 1.446 1.422 0 2.515-1.5 2.515-3.664 0-1.915-1.377-3.254-3.342-3.254-2.276 0-3.612 1.707-3.612 3.471 0 .688.265 1.425.595 1.826a.24.24 0 0 1 .056.23c-.061.252-.196.796-.222.907-.035.146-.116.177-.268.107-1-.465-1.624-1.926-1.624-3.1 0-2.523 1.834-4.84 5.286-4.84 2.775 0 4.932 1.977 4.932 4.62 0 2.757-1.739 4.976-4.151 4.976-.811 0-1.573-.421-1.834-.919l-.498 1.902c-.181.695-.669 1.566-.995 2.097A8 8 0 1 0 8 0"/>
                                    </svg>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
                @if(isset($product->product_details) && strlen($product->product_details) > 0)
                    <div class="col-12 mt-5 mb-5">
                        <h2>{{trans('file.Description')}}</h2>
                        <div class="item-description">
                            {!! $product->product_details !!}
                        </div>
                    </div>
                @endif
            </div>
        </div>
    </section>
    <!--Product details section ends-->
    @if(isset($related_products) && count($related_products) > 0)
        <section>
            <div class="container-fluid">
                <div class="section-title mb-3">
                    <div class="d-flex align-items-center">
                        <h3>{{trans('file.You may also like')}}</h3>
                    </div>
                    @if(count($related_products) > 5 && $ecommerce_setting->theme != 'fashion')
                        <div class="product-navigation">
                            <div class="product-button-next v1"><span
                                    class="material-symbols-outlined">chevron_right</span></div>
                            <div class="product-button-prev v1"><span
                                    class="material-symbols-outlined">chevron_left</span></div>
                        </div>
                    @endif
                </div>
                <div class="product-slider-wrapper swiper-container" data-loop="" data-autoplay=""
                     data-autoplay-speed="">
                    <div class="swiper-wrapper">
                        @foreach($related_products as $product)
                            <div class="swiper-slide">
                                @include('ecommerce::frontend.includes.product-template')
                            </div>
                        @endforeach
                    </div>
                    @if(count($related_products) > 5 && $ecommerce_setting->theme == 'fashion')
                        <div class="product-navigation">
                            <div class="product-button-next v1"><span
                                    class="material-symbols-outlined">chevron_right</span></div>
                            <div class="product-button-prev v1"><span
                                    class="material-symbols-outlined">chevron_left</span></div>
                        </div>
                    @endif
                </div>
            </div>
        </section>
    @endif

    @if(count($recently_viewed) > 0)
        @include('ecommerce::frontend.includes.recently-viewed-products')
    @endif

@endsection

@section('script')

    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-zoom/1.6.1/jquery.zoom.min.js"></script>

    @if(!config('database.connections.saleprosaas_landlord'))
        <script>
            {!! file_get_contents(Module::find('Ecommerce')->getPath(). "/assets/js/swiper.min.js") !!}
        </script>
    @else
        <script>
            {!! file_get_contents(Module::find('Ecommerce')->getPath(). "/assets/js/swiper.min.js") !!}
        </script>
    @endif

    <script type="text/javascript">
        "use strict";

        // SLICK
        $('.slider-for').slick({
            slidesToShow: 1,
            slidesToScroll: 1,
            arrows: false,
            fade: true,
            asNavFor: '.slider-nav'
        });
        $('.slider-nav').slick({
            slidesToShow: 4,
            slidesToScroll: 1,
            asNavFor: '.slider-for',
            dots: false,
            focusOnSelect: true
        });

        // ZOOM
        $('.ex1').zoom();

        // STYLE GRAB
        $('.ex2').zoom({
            on: 'grab'
        });

        // STYLE CLICK
        $('.ex3').zoom({
            on: 'click'
        });

        // STYLE TOGGLE
        $('.ex4').zoom({
            on: 'toggle'
        });

        function reloadData(x, y) {

            var price = x + y;


            $('.price2').html(price);

        }

        @if($product->is_variant == 1)
        var combination = '';
        $(document).on('click', '.variant_val', function () {
            $(this).parent().children('.variant_val').removeClass('selected');
            $(this).addClass('selected');

            // Check if all variant options are selected
            if ($('.variant_val.selected').length == {{count($product->variant_option)}}) {
                combination = '';

                // Build the combination string
                $('.variant_val.selected').each(function () {
                    if (combination.length) {
                        combination = combination + '/' + $(this).html();
                    } else {
                        combination = $(this).html();
                    }
                });

                // Parse the variants JSON
                var variants = JSON.parse('{!! json_encode($variant) !!}');

                // Find the matching combination
                var match = variants.find(variant => variant.name === combination);

                // Get quantity or set to 0 if not found
                var qty = match ? match.qty : 0;
                @if($product->in_stock != 1)
                // Update the max attribute of the input field
                $('.input-number').attr('max', qty);
                @endif

                // Display alert and enable Add-to-Cart button
                $('.add-to-cart').attr('disabled', false);
            } else {
                // Disable Add-to-Cart button if not all options are selected
                $('.add-to-cart').attr('disabled', true);
            }
        });
        @endif


        $(document).on('click', '.add-to-cart', function (e) {
            e.preventDefault();
            var id = $(this).data('id');
            var parent = '#add_to_cart_' + id;
            var price = $('.price2').html();

            console.log("price", price);

            var qty = $(parent + " input[name=qty]").val();
            @if($product->is_variant == 1)
            var variant = [];
            $('.variant_val.selected').each(function () {
                variant.push($(this).html());
            })
            @endif
            var route = "{{ route('addToCart') }}";

            $.ajax({
                url: route,
                type: "POST",
                data: {
                    @if($product->is_variant == 1)

                    product_id: id + ',' + variant,
                    qty: qty,
                    price:price,
                    variant: variant,
                    price:price
                    @else

                    product_id: id,
                    qty: qty,
                    variant: 0,
                    price:price
                    @endif
                },
                success: function (response) {
                    console.log(response);
                    if (response) {
                        $('.alert').addClass('alert-custom show');
                        $('.alert-custom .message').html(response.success);
                        $('.cart__menu .cart_qty').html(response.total_qty);
                        $('.cart__menu .total').html('{{$currency->symbol ?? $currency->code}}' + response.subTotal);

                        @if($product->is_variant == 1)
                        $('.add-to-cart').attr('disabled', true);
                        $('.variant_val').removeClass('selected');
                        @endif

                        setTimeout(function () {
                            $('.alert').removeClass('show');
                        }, 4000);
                    }
                },
            });
        })

        //product carousel
        if (('.product-slider-wrapper').length > 0) {
            $('.product-slider-wrapper').each(function () {
                var swiper = new Swiper('.product-slider-wrapper', {
                    @if($ecommerce_setting->theme == 'fashion')
                    slidesPerView: 4,
                    @else
                    slidesPerView: 5,
                    @endif
                    spaceBetween: 0,
                    lazy: true,
                    //centeredSlides: true,
                    loop: $(this).data('loop'),
                    navigation: {
                        nextEl: '.product-button-next',
                        prevEl: '.product-button-prev',
                    },
                    autoplay: {
                        delay: 4000,
                    },
                    // Responsive breakpoints
                    breakpoints: {
                        // when window width is <= 675
                        675: {
                            slidesPerView: 2,
                            spaceBetween: 30
                        },

                        // when window width is <= 991
                        991: {
                            slidesPerView: 4,
                            spaceBetween: 30
                        },
                        // when window width is <= 1024px
                        1024: {
                            slidesPerView: 6,
                            spaceBetween: 15
                        }
                    }
                });
            })
        }
    </script>
@endsection
