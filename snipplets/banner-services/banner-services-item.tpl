<div class="service-item-container col-lg swiper-slide p-0 px-lg-3">
    <div class="service-item d-flex justify-content-center align-items-center">
        
        <div class="service-item-icon">
            {% if banner_services_icon == 'shipping' %}
                {% include "snipplets/svg/truck.tpl" with {svg_custom_class: "service-icon"} %}
            {% elseif banner_services_icon == 'card' %}
                {% include "snipplets/svg/credit-card-blank.tpl" with {svg_custom_class: "service-icon"} %}
            {% elseif banner_services_icon == 'security' %}
                {% include "snipplets/svg/lock.tpl" with {svg_custom_class: "service-icon"} %}
            {% elseif banner_services_icon == 'returns' %}
                {% include "snipplets/svg/sync-alt.tpl" with {svg_custom_class: "service-icon"} %}
            {% elseif banner_services_icon == 'whatsapp' %}
                {% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: "service-icon service-icon-big"} %}
            {% elseif banner_services_icon == 'promotions' %}
                {% include "snipplets/svg/tag.tpl" with {svg_custom_class: "service-icon"} %}
            {% elseif banner_services_icon == 'cash' %}
                {% include "snipplets/svg/dollar-sign.tpl" with {svg_custom_class: "service-icon"} %}
            {% elseif banner_services_icon == 'calendario' %}
                {% include "snipplets/svg/calendar-alt.tpl" with {svg_custom_class: "service-icon"} %}
            {% endif %}
        </div>
        <div class="service-item-description">
            {% if banner_services_url %}
                <a href="{{ banner_services_url }}">
            {% endif %}
            <h3 class="service-title">{{ banner_services_title }}</h3>
            <p>{{ banner_services_description | raw }}</p>
            {% if banner_services_url %}
                </a>
            {% endif %}
        </div>
    </div>
</div>
