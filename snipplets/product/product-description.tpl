
<div class="product-description user-content" data-store="product-description-{{ product.id }}">
    <h5 class="my-3 h3">
        {% if settings.product_description_title %}
            {{ settings.product_description_title }}
        {% else %}
            {{ "Descripción" | translate }}
        {% endif %}
    </h5>
    <div class="product-description-text">
        {{ product.description }}
    </div>
</div>