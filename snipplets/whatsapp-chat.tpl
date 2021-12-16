{% if store.whatsapp or ( settings.buy_whatsapp_unique_link_active and settings.buy_whatsapp_unique_link != '' ) %}
    <a href="{% if settings.buy_whatsapp_unique_link_active %}{{ settings.buy_whatsapp_unique_link }}{% else %}{{ store.whatsapp }}{% endif %}" target="_blank" class="js-btn-fixed-bottom btn-whatsapp" aria-label="{{ 'Comunicate por WhatsApp' | translate }}">
        {% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: "icon-inline icon-2x"} %}
    </a>
{% endif %}
