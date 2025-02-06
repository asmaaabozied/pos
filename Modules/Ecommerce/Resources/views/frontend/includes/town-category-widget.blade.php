    @php
    
        $products = DB::table('products')->where('is_active', true)->where('category_id',$widget->product_category_id)->get();
        
     
        @endphp

    <section class="product-tab-section">
        <div class="container-fluid">
            <div class="section-title mb-3">
                <div class="d-flex align-items-center">
                    <h3>{{$widget->product_category_title}}</h3>
                </div>
             
            </div> 

     @if($products)
            <div class="product-grid">
                @foreach($products as $product)
                @include('ecommerce::frontend.includes.product-template')
                @endforeach
            </div>
            @endif
         
        </div>
    </section>
