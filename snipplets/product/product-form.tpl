{# Product name and breadcrumbs #}

<h1 class="product-title">{{ product.name }}</h1>

{# Promotional text #}

{% if product.promotional_offer and not product.promotional_offer.script.is_percentage_off and product.display_price %}
    <div class="js-product-promo-container text-center text-md-left">
        {% if product.promotional_offer.script.is_discount_for_quantity %}
            {% for threshold in product.promotional_offer.parameters %}
                <h4 class="mb-2 text-accent"><strong>{{ "¡{1}% OFF comprando {2} o más!" | translate(threshold.discount_decimal_percentage * 100, threshold.quantity) }}</strong></h4>
            {% endfor %}
        {% else %}
            <h4 class="mb-2 text-accent"><strong>{{ "¡Llevá {1} y pagá {2}!" | translate(product.promotional_offer.script.quantity_to_take, product.promotional_offer.script.quantity_to_pay) }}</strong></h4> 
        {% endif %}
        {% if product.promotional_offer.scope_type == 'categories' %}
            <p>{{ "Válido para" | translate }} {{ "este producto y todos los de la categoría" | translate }}:  
            {% for scope_value in product.promotional_offer.scope_value_info %}
               {{ scope_value.name }}{% if not loop.last %}, {% else %}.{% endif %}
            {% endfor %}</br>{{ "Podés combinar esta promoción con otros productos de la misma categoría." | translate }}</p>
        {% elseif product.promotional_offer.scope_type == 'all'  %}
            <p>{{ "Vas a poder aprovechar esta promoción en cualquier producto de la tienda." | translate }}</p>
        {% endif %}  
    </div> 
{% endif %}


{# Product form, includes: Variants, CTA and Shipping calculator #}

 <form id="product_form" class="js-product-form" method="post" action="{{ store.cart_url }}" data-store="product-form-{{ product.id }}">
	<input type="hidden" name="add_to_cart" value="{{product.id}}" />
 	{% if product.variations %}
        {% include "snipplets/product/product-variants.tpl" %}
    {% endif %}


    {% set show_whatsapp_cta = settings.buy_whatsapp and settings.buy_whatsapp_min_price <= (product.price / 100) %}

    {% if show_whatsapp_cta %}

        <div class="mt-5">
            {% include 'snipplets/whatsapp-cta.tpl' %}
        </div>

    {% else %}
        <div class="product-cta-box">
            <div class="d-flex align-items-center justify-content-md-between justify-content-center flex-wrap flex-lg-nowrap">

                <div class="product-price-box">
                    {# Product price #}

                    <div class="price-container text-center text-md-left" data-store="product-price-{{ product.id }}">
                        <h4 id="compare_price_display" class="js-compare-price-display price-compare {% if product_can_show_installments or (product.promotional_offer and not product.promotional_offer.script.is_percentage_off) %}mb-2{% endif %}" {% if not product.compare_at_price or not product.display_price %}style="display:none;"{% else %} style="display:block;"{% endif %}>{% if product.compare_at_price and product.display_price %}{{ product.compare_at_price | money }}{% endif %}</h4>
                        <h4 class="js-price-display {% if product_can_show_installments or (product.promotional_offer and not product.promotional_offer.script.is_percentage_off) %}mb-2{% endif %}" id="price_display" {% if not product.display_price %}style="display:none;"{% endif %}>{% if product.display_price %}{{ product.price | money }}{% endif %}</h4>
                    </div>

                    {# Product installments #}

                    {% include "snipplets/payments/installments.tpl" with {'product_detail' : true} %}
                </div>

                <div class="product-add-to-cart-box mt-3 mt-lg-0">
                    <div class="d-flex align-items-center">
                        
                        {% if product.available and product.display_price %}
                            {% include "snipplets/product/product-quantity.tpl" with { product_detail: true } %}
                        {% endif %}

                        {% set state = store.is_catalog ? 'catalog' : (product.available ? product.display_price ? 'cart' : 'contact' : 'nostock') %}
                        {% if settings.product_cta_title %}
                            {% set addToCartText = settings.product_cta_title %}
                        {% else %}
                            {% set addToCartText = "Agregar al carrito" %}
                        {% endif  %}
                        {% set texts = {'cart': addToCartText, 'contact': "Consultar precio", 'nostock': "Sin stock", 'catalog': "Consultar"} %}

                        {# Add to cart CTA #}

                        <div class="product-add-to-cart">

                            <input type="submit" class="js-addtocart js-prod-submit-form btn btn-success btn-block {{ state }}" value="{{ texts[state] | translate }}" {% if state == 'nostock' %}disabled{% endif %} />

                            {# Fake add to cart CTA visible during add to cart event #}

                            {% include 'snipplets/placeholders/button-placeholder.tpl' with {custom_class: "btn-block"} %}

                        </div>

                    </div>
                </div>

            </div>


        </div>
    
        {% if settings.last_product %}
            <div class="{% if product.variations %}js-last-product {% endif %}text-center text-md-left my-3"{% if product.selected_or_first_available_variant.stock != 1 %} style="display: none;"{% endif %}>
                <div class="h6 text-accent font-weight-bold">
                    {{ settings.last_product_text }}
                </div>
            </div>
        {% endif %}
        <div class="js-added-to-cart-product-message w-100 mb-3 mt-2 text-center text-md-left" style="display: none;">
            {{'Ya agregaste este producto.' | translate }}<a href="#" class="js-modal-open js-fullscreen-modal-open ml-1" data-toggle="#modal-cart" data-modal-url="modal-fullscreen-cart">{{ 'Ver carrito' | translate }}</a>
        </div>
    {% endif %}

    
    

    {# Define contitions to show shipping calculator and store branches on product page #}

    {% set show_product_fulfillment = settings.shipping_calculator_product_page and (store.has_shipping or store.branches) and not product.free_shipping and not product.is_non_shippable %}

    {% if show_product_fulfillment %}

        {# Shipping calculator and branch link #}

        <div id="product-shipping-container" class="product-shipping-calculator list mt-4" {% if not product.display_price or not product.has_stock %}style="display:none;"{% endif %} data-shipping-url="{{ store.shipping_calculator_url }}">

            {# Shipping Calculator #}
            
            {% if store.has_shipping %}
                {% include "snipplets/shipping/shipping-calculator.tpl" with {'shipping_calculator_variant' : product.selected_or_first_available_variant, 'product_detail': true} %}
            {% endif %}

            {% if store.branches %}
                
                {# Link for branches #}
                {% include "snipplets/shipping/branches.tpl" with {'product_detail': true} %}
            {% endif %}
        </div>
        
    {% endif %} 
 </form>

{# Product payments details #}

{% include 'snipplets/payments/payments.tpl' %}

{# Product share #}

{% if settings.product_social_share %}
    <div class="divider"></div>
    {% include 'snipplets/social/social-share.tpl' %}
{% endif %}

{# Product description #}

{% if product.description is not empty and settings.product_description_position == 1 %}
    <div class="divider"></div>
    {% include 'snipplets/product/product-description.tpl' %}    
{% endif %}

