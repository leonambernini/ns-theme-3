{# /*============================================================================
  #Contact links
==============================================================================*/#}

<ul class="contact-info">
{% if store.whatsapp or store.phone or ( settings.buy_whatsapp_unique_link_active and settings.buy_whatsapp_unique_link != '' ) %}
  <li class="contact-item">
    {% if store.whatsapp or ( settings.buy_whatsapp_unique_link_active and settings.buy_whatsapp_unique_link != '' ) %}
        <a href="{% if settings.buy_whatsapp_unique_link_active %}{{ settings.buy_whatsapp_unique_link }}{% else %}{{ store.whatsapp }}{% endif %}" class="contact-link">
          {% include "snipplets/svg/whatsapp.tpl" with {svg_custom_class: "icon-inline icon-2x"} %} Fale pelo WhatsApp
        </a>
    {% endif %}
    <div class="w-100"></div>
    {% if store.phone %}
        <a href="tel:{{ store.phone }}" class="contact-link">{{ store.phone }}</a>
    {% endif %}
  </li>
  {% endif %}
{% if store.email %}
    <li class="contact-item">
		<a href="mailto:{{ store.email }}" class="contact-link text-overflow">{{ store.email }}</a>
    </li>
{% endif %}
{% if store.address and not is_order_cancellation %}
    <li class="contact-item">
		{{ store.address }}
    </li>
{% endif %}
{% if store.blog %}
    <li class="contact-item">
		<a target="_blank" href="{{ store.blog }}" class="contact-link">{{ "Visita nuestro Blog!" | translate }}</a>
    </li>
{% endif %}
{% if settings.store_map %}
    <li class="contact-item">
		<a target="_blank" href="{{ settings.store_map }}" class="contact-link">
			{% include "snipplets/svg/map-marker-alt.tpl" with {svg_custom_class: "icon-inline"} %}
			{{ "Ver mapa" | translate }}
		</a>
    </li>
{% endif %}
</ul>