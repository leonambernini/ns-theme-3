{# /*============================================================================
  #Page breadcrumbs
==============================================================================*/
#Properties

#Breadcrumb
    //breadcrumbs_custom_class for custom CSS classes
#}

{% if breadcrumbs %}
    {% set is_category = iscategory | default(false) %}

    {% if not is_category %}
    <div class="breadcrumbs-bg">
        <div class="container">
    {% endif %}
            <div class="breadcrumbs {{ breadcrumbs_custom_class }}">
                <a class="crumb" href="{{ store.url }}" title="{{ store.name }}">{{ "Inicio" | translate }}</a>
                <span class="divider">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-w-16"} %} </span>
                {% if template == 'page' %}
                    <span class="crumb active">{{ page.name }}</span>
                {% elseif template == 'category' %}
                    <span class="crumb active">{{ category.name }}</span>
                {% elseif template == 'cart' %}
                    <span class="crumb active">{{ "Carrito de compras" | translate }}</span>
                {% elseif template == 'search' %}
                    <span class="crumb active">{{ "Resultados de búsqueda" | translate }}</span>
                {% elseif template == 'account.order' %}
                    <span class="crumb active">{{ 'Orden {1}' | translate(order.number) }}</span>
                {% else %}
                    {% for crumb in breadcrumbs %}
                        {% if crumb.last %}
                            <span class="crumb active">{{ crumb.name }}</span>
                        {% else %}
                            <a class="crumb" href="{{ crumb.url }}" title="{{ crumb.name }}">{{ crumb.name }}</a>
                            <span class="divider">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-w-16"} %} </span>
                        {% endif %}
                    {% endfor %}
                {% endif %}
            </div>
    {% if not is_category %}
        </div>
    </div>
    {% endif %}
{% endif %}
