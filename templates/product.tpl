{# Payments details #}
<div id="single-product" class="js-has-new-shipping js-product-detail js-product-container js-shipping-calculator-container" data-variants="{{product.variants_object | json_encode }}">

    <div class="container mt-4">
        <div class="row section-single-product">
            <div class="col-12 col-md-6 px-0 px-md-3" data-store="product-image-{{ product.id }}">
            	{% include 'snipplets/product/product-image.tpl' %}
            </div>
            <div class="col" data-store="product-info-{{ product.id }}">
                {% include 'snipplets/breadcrumbs.tpl' with {iscategory: true} %}
            	{% include 'snipplets/product/product-form.tpl' %}
            </div>
        </div>
    </div>  
</div>

{# Product description #}

{% if product.description is not empty and settings.product_description_position == 2 %}
    <div class="container">
        {% include 'snipplets/product/product-description.tpl' %}    
    </div>
{% endif %}

{# Related products #}
{% include 'snipplets/product/product-related.tpl' %}

<div class="container">
    {% if settings.show_product_fb_comment_box %}
        <div class="fb-comments section-fb-comments" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
    {% endif %}
    <div id="reviewsapp"></div>
</div>
