{% macro for_each_banner_include(template) %}
    {% set num_banners_services = 0 %}
    {% set available_banners = []%}
    {% for banner in ['banner_services_01', 'banner_services_02', 'banner_services_03', 'banner_services_04'] %}
        {% set banner_services_icon = attribute(settings,"#{banner}_icon") %}
        {% set banner_services_title = attribute(settings,"#{banner}_title") %}
        {% set banner_services_description = attribute(settings,"#{banner}_description") %}
        {% set banner_services_url = attribute(settings,"#{banner}_url") %}
        {% set has_banner_services =  banner_services_title or banner_services_description %}
        {% if has_banner_services %}
            {% set num_banners_services = num_banners_services + 1 %}
            {% set available_banners = available_banners | merge([banner]) %}
        {% endif %}
    {% endfor %}
    {% for banner in available_banners %}
        {% set banner_services_title = attribute(settings,"#{banner}_title") %}
        {% set banner_services_icon = attribute(settings,"#{banner}_icon") %}
        {% set banner_services_description = attribute(settings,"#{banner}_description") %}
        {% set banner_services_url = attribute(settings,"#{banner}_url") %}
        {% include template %}
    {% endfor %}
{% endmacro %}
{% import _self as banner_services %}
{% if ( template == 'home' and settings.banner_services ) or ( ( template == 'category' or template == 'search' ) and settings.banner_services_category ) or ( template == 'product' and settings.banner_services_product ) or ( ( template != 'home' and template != 'product' and template != 'category' and template != 'search' ) and settings.banner_services_pages ) %}
    <section class="section-informative-banners {% if is_footer %}informative-banners-footer{% endif %}" data-store="banner-services">
        <div class="container">
            <div class="row">
                <div class="js-informative-banners swiper-container">
                    <div class="swiper-wrapper">
                        {{ banner_services.for_each_banner_include('snipplets/banner-services/banner-services-item.tpl') }}
                    </div>
                </div>
            </div>
        </div>
    </section>
{% endif %}