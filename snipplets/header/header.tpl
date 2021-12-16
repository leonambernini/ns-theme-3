{# Site Overlay #}
<div class="js-overlay site-overlay" style="display: none;"></div>


{# Advertising #}
{% snipplet "header/header-advertising.tpl" %}

{# Header #}

<header class="js-head-main header {% if settings.head_fix %}sticky-top{% endif %}" data-store="head">

    <div class="header-primary">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <div class="header-nav-mobile d-block d-lg-none">{% snipplet "navigation/navigation.tpl" %}</div>
                <div class="header-logo mr-auto">{% snipplet "header/header-logo.tpl" %}</div>
                <div class="header-account d-none d-lg-block">
                    <div class="dropdrown-box">
                        <a href="{{ store.customer_home_url }}" class="header-link-icon d-flex align-items-center">
                            {% include "snipplets/svg/user.tpl" with {svg_custom_class: "icon"} %}
                            <span class="ml-1 d-none d-lg-block">Minha Conta</span>
                        </a>
                        <ul class="dropdrown-content" data-store="account-links">
                            {% if not customer %}
                                {% if 'mandatory' not in store.customer_accounts %}
                                <li class="dropdown-item">{{ "Crear cuenta" | translate | a_tag(store.customer_register_url, '', 'nav-accounts-link') }}</li>
                                {% endif %}
                                <li class="dropdown-item">{{ "Iniciar sesión" | translate | a_tag(store.customer_login_url, '', 'nav-accounts-link') }}</li>
                            {% else %}
                                <li class="dropdown-item">{{ "¡Hola, {1}!" | t(customer.name) | a_tag(store.customer_home_url, {class: 'nav-accounts-link'}) }}</li>
                                <li class="dropdown-item">{{ "Cerrar sesión" | translate | a_tag(store.customer_logout_url, '', 'nav-accounts-link') }}</li>
                            {% endif %}
                        </ul>
                    </div>
                    
                </div>

                <div class="header-search d-none d-md-block flex-fill">
                    {% snipplet "header/header-search.tpl" %}
                </div>

                {% if store.whatsapp or ( settings.buy_whatsapp_unique_link_active and settings.buy_whatsapp_unique_link != '' ) %}
                    <a href="{% if settings.buy_whatsapp_unique_link_active %}{{ settings.buy_whatsapp_unique_link }}{% else %}{{ store.whatsapp }}{% endif %}" target="_blank" class="header-link-icon d-none d-md-flex align-items-center" aria-label="{{ 'Comunicate por WhatsApp' | translate }}">
                        {% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: "icon"} %}
                        <span class="ml-1 d-none d-lg-block">Fale Conosco</span>
                    </a>
                {% endif %}
                
                <div class="header-search-mobile d-block d-md-none">
                    <a href="#" class="js-modal-open js-toggle-search utilities-link" data-toggle="#nav-search" aria-label="{{ 'Buscador' | translate }}">
                        {% include "snipplets/svg/search.tpl" with {svg_custom_class: "icon-inline icon-w-16 svg-icon-text"} %}
                    </a>
                </div>

                {% if not store.is_catalog %}    
                    <div class="header-cart">
                        <div id="ajax-cart" class="cart-summary">
                            <a {% if settings.ajax_cart and template != 'cart' %}href="#" class="js-modal-open js-fullscreen-modal-open js-toggle-cart" data-toggle="#modal-cart" data-modal-url="modal-fullscreen-cart"{% else %}href="{{ store.cart_url }}"{% endif %}>
                                {% include "snipplets/svg/shopping-bag.tpl" with {svg_custom_class: "icon-inline icon-w-14 svg-icon-text"} %}
                                <span class="js-cart-widget-amount cart-widget-amount">{{ "{1}" | translate(cart.items_count ) }}</span>
                            </a>
                        </div>
                    </div>
                {% endif %}
            </div>
        </div>    
    </div>

    <nav class="header-desktop-nav d-none d-lg-block">
        <div class="container">
            <ul class="d-flex justify-content-center align-items-center">
                {% include "snipplets/navigation/navigation-nav-list.tpl" with {desktop: true} %}
            </ul>
        </div>
    </nav>

    {% include "snipplets/notification.tpl" with {order_notification: true} %}
    {% if settings.head_fix and settings.ajax_cart %}
        {% include "snipplets/notification.tpl" with {add_to_cart: true} %}
    {% endif %}
</header>

{% if not settings.head_fix %}
    {% include "snipplets/notification.tpl" with {add_to_cart: true, add_to_cart_fixed: true} %}
{% endif %}

{# Show cookie validation message #}
{% include "snipplets/notification.tpl" with {show_cookie_banner: true} %}

{# Add notification for order cancellation #}
{% if store.country == 'AR' and template == 'home' and status_page_url %}
    {% include "snipplets/notification.tpl" with {show_order_cancellation: true} %}
{% endif %}

{# Hamburger panel #}

{% embed "snipplets/modal.tpl" with{modal_id: 'nav-hamburger',modal_class: 'nav-hamburger modal-docked-small', modal_position: 'left', modal_transition: 'fade', modal_width: 'full', modal_fixed_footer: true, modal_footer: true, modal_footer_class: 'p-0' } %}
    {% block modal_body %}
        {% include "snipplets/navigation/navigation-panel.tpl" with {primary_links: true} %}
    {% endblock %}
    {% block modal_foot %}
        {% include "snipplets/navigation/navigation-panel.tpl" %}
    {% endblock %}
{% endembed %}
{# Notifications #}

{# Modal Search #}

{% embed "snipplets/modal.tpl" with{modal_id: 'nav-search', modal_position: 'right', modal_transition: 'slide', modal_width: 'docked-md' } %}
    {% block modal_body %}
        {% snipplet "header/header-search.tpl" %}
    {% endblock %}
{% endembed %}

{% if not store.is_catalog and settings.ajax_cart and template != 'cart' %}           

    {# Cart Ajax #}

    {% embed "snipplets/modal.tpl" with{modal_id: 'modal-cart', modal_position: 'right', modal_transition: 'slide', modal_width: 'docked-md', modal_form_action: store.cart_url, modal_form_class: 'js-ajax-cart-panel', modal_mobile_full_screen: true, modal_form_hook: 'cart-form' } %}
        {% block modal_head %}
            {% block page_header_text %}{{ "Carrito de Compras" | translate }}{% endblock page_header_text %}
        {% endblock %}
        {% block modal_body %}
            {% snipplet "cart-panel.tpl" %}
        {% endblock %}
    {% endembed %}

{% endif %}


{#  **** Informative banners ****  #}
{% if settings.banner_services_local_show == 'top' and template != 'home' %}
	{% include 'snipplets/banner-services/banner-services.tpl' %}
{% endif %}