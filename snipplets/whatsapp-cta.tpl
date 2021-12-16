{% set whatsapp_number = settings.buy_whatsapp_numbers | split(',') %}
    {% set whatsapp_msg = 'Olá, tenho interesse neste produto [nome]' %}
{% if settings.buy_whatsapp_msg != '' %}
    {% set whatsapp_msg = settings.buy_whatsapp_msg %}
{% endif %}
{% set url_whatsapp = 'https://api.whatsapp.com/send?phone=55'~ random(whatsapp_number) ~'&text=' ~ whatsapp_msg | replace('[nome]', product.name) %}
<a href="{{ url_whatsapp }}" target="_blank" class="btn-buy-whatsapp btn btn-success">
    {% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: "icon-inline"} %}
    {% if settings.buy_whatsapp_cta != '' %}
        {{ settings.buy_whatsapp_cta }}
    {% else %}
        Compre pelo WhatsApp
    {% endif %}
</a>