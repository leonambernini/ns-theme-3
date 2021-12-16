{# /*============================================================================
  #Home featured grid
==============================================================================*/

#Properties

#Featured Slider

#}


{% set section_products = products %}
{% set show_bg = show_bg | default(false) %}

{% if section_products %}
    <section class="section-featured-home {% if show_bg %}section-home-bg{% endif %}" data-store="products-home-featured">
        <div class="container">
            <div class="row">
                {% if title %}
                    <div class="col-12 text-center">
                        <h3 class="showcase-title">{{ title }}</h3>
                    </div>
                {% endif %}
                <div class="col-12">
                    <div class="js-swiper-featured swiper-container">
                        <div class="swiper-wrapper">
                            {% for product in section_products %}
                                {% include 'snipplets/grid/item.tpl' with {'slide_item': true} %}
                            {% endfor %}

                        </div>
                        <div class="js-swiper-featured-pagination swiper-pagination"></div>
                        <div class="js-swiper-featured-prev swiper-button-prev d-none d-md-block">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-w-8 icon-2x svg-icon-text"} %}</div>
                        <div class="js-swiper-featured-next swiper-button-next d-none d-md-block">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-w-8 icon-2x svg-icon-text"} %}</div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    {% set section_name = 'primary' %}
{% endif %}