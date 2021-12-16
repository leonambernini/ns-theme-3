{#  **** Informative banners ****  #}
{% if settings.banner_services_local_show == 'bottom' and template != 'home' %}
	{% include 'snipplets/banner-services/banner-services.tpl' with { is_footer: true } %}
{% endif %}


{% set has_social_network = store.facebook or store.twitter or store.pinterest or store.instagram or store.tiktok or store.youtube %}
{% set has_footer_contact_info = store.phone or store.email or store.blog or store.address %}          

{% set has_footer_menu = settings.footer_menu %}
{% set has_department_menu = settings.footer_menu_department %}
{% set has_payment_logos = settings.payments %}
{% set has_shipping_logos = settings.shipping %}
<footer class="js-hide-footer-while-scrolling display-when-content-ready" data-store="footer">

	{% if template != 'password' %}
	<div class="footer-news">
		<div class="container">
			<div class="d-lg-flex justify-content-between">
				{# Newsletter #}
				{% if settings.news_show %}
					<div class="footer-news">
						{% include "snipplets/newsletter.tpl" %}
					</div>
				{% endif %}
			</div>
		</div>
	</div>
	{% endif %}


	<div class="footer-navs {% if settings.footer_mobile_hide %}footer-navs-hide-mobile{% endif %}">
		<div class="container">

			<div class="row">

				{% if settings.about_us and settings.about_us_description %}
					<div class="col-12 col-md-4">
						{% include 'snipplets/home/home-about-us.tpl' %}
					</div>
				{% endif %}

				<div class="col">

					<div class="row">
						
						{# Contact #}
						{% if has_footer_contact_info %}
							<div class="col-12 col-md-4 footer-navs-contact js-footer-mobile-box">
								<h4 class="js-footer-mobile-title">
									{% if settings.contact_title %}
										{{ settings.contact_title }}
									{% else %}
										Contato
									{% endif %}
								</h4>
								<div class="js-footer-mobile-content">
									{% include "snipplets/contact-links.tpl" %}
								</div>
							</div>
						{% endif %}

						{% if template != 'password' %}

							{# Foot Nav #}
							{% if has_footer_menu %}
								<div class="col-12 col-md-4 footer-navs-institucional js-footer-mobile-box">
									<h4 class="js-footer-mobile-title">
										{% if settings.institutional_title %}
											{{ settings.institutional_title }}
										{% else %}
											Institucional
										{% endif %}
									</h4>
									<div class="js-footer-mobile-content">
										{% include "snipplets/navigation/navigation-foot.tpl" %}
									</div>
								</div>
							{% endif %}

						{% endif %}

						{% if template != 'password' %}

							{# Foot Nav #}
							{% if has_department_menu %}
								<div class="col-12 col-md-4 footer-navs-institucional js-footer-mobile-box">
									<h4 class="js-footer-mobile-title">
										{% if settings.department_title_footer %}
											{{ settings.department_title_footer }}
										{% else %}
											Departamentos
										{% endif %}
									</h4>
									<div class="js-footer-mobile-content">
										{% include "snipplets/navigation/navigation-foot.tpl" %}
									</div>
								</div>
							{% endif %}

						{% endif %}

					
						{# Logos Payments and Shipping #}
						{% if has_payment_logos %}
							<div class="col-12 col-md-4 footer-navs-payment js-footer-mobile-box">
								<h4 class="js-footer-mobile-title">
									{% if settings.payment_title %}
										{{ settings.payment_title }}
									{% else %}
										Formas de Pagamento
									{% endif %}
								</h4>
								<div class="js-footer-mobile-content d-flex flex-wrap">
									{% include "snipplets/logos-icons.tpl" with {'payments': true} %}
								</div>
							</div>
						{% endif %}

						{# Social #}
						{% if has_social_network %}
							<div class="col-12 col-md-4 footer-social js-footer-mobile-box">
								<h4 class="js-footer-mobile-title">
									{% if settings.social_network_title %}
										{{ settings.social_network_title }}
									{% else %}
										Redes Sociais
									{% endif %}
								</h4>
								<div class="js-footer-mobile-content d-flex flex-wrap">
									{% include "snipplets/social/social-links.tpl" %}
								</div>
							</div>
						{% endif %}

						{% if has_shipping_logos %}
							<div class="col-12 col-md-4 footer-navs-shipping js-footer-mobile-box">
								<h4 class="js-footer-mobile-title">
									{% if settings.shipping_title %}
										{{ settings.shipping_title }}
									{% else %}
										Formas de Envio
									{% endif %}
								</h4>
								<div class="js-footer-mobile-content d-flex flex-wrap">
									{% include "snipplets/logos-icons.tpl" with {'shipping': true} %}
								</div>
							</div>
						{% endif %}

					</div>

				</div>
			</div>

			{# AFIP - EBIT - Custom Seal #}
			{% if store.afip or ebit or settings.custom_seal_code or ("seal_img.jpg" | has_custom_image) %}
				<div class="footer-ebit d-flex align-items-center flex-rwap">
					{% if store.afip or ebit %}
						<div class="text-center">
							{% if store.afip %}
								<div class="footer-logo afip seal-afip">
									{{ store.afip | raw }}
								</div>
							{% endif %}
							{% if ebit %}
								<div class="footer-logo ebit seal-ebit">
									{{ ebit }}
								</div>
							{% endif %}
						</div>
					{% endif %}
					{% if "seal_img.jpg" | has_custom_image or settings.custom_seal_code %}
						{% if "seal_img.jpg" | has_custom_image %}
							<div class="footer-logo custom-seal">
								{% if settings.seal_url != '' %}
									<a href="{{ settings.seal_url }}" target="_blank">
								{% endif %}
									<img src="{{ 'images/empty-placeholder.png' | static_url }}" data-src="{{ "seal_img.jpg" | static_url }}" class="custom-seal-img lazyload" alt="{{ 'Sello de' | translate }} {{ store.name }}"/>
								{% if settings.seal_url != '' %}
									</a>
								{% endif %}
							</div>
						{% endif %}
						{% if settings.custom_seal_code %}
							<div class="custom-seal custom-seal-code">
								{{ settings.custom_seal_code | raw }}
							</div>
						{% endif %}
					{% endif %}
				</div>
			{% endif %}

		</div>
	</div>

	<div class="footer-copyright">
		<div class="container">

			<div class="d-flex justify-content-between align-items-center flex-wrap flex-md-nowrap">
				<div class="copyright text-center text-md-left pb-4 pb-md-0">
					{{ "Copyright {1} - {2}. Todos los derechos reservados." | translate( (store.business_name ? store.business_name : store.name) ~ (store.business_id ? ' - ' ~ store.business_id : ''), "now" | date('Y') ) }}
					{% if store.country == 'AR' %}
						<div class="claim-link mt-2">
						{{ "Defensa de las y los consumidores. Para reclamos" | translate }}
						<a class="font-weight-bold" href="https://www.argentina.gob.ar/produccion/defensadelconsumidor/formulario" target="_blank">{{ "ingrese aquí" | translate }}</a>
						</div>
					{% endif %}
				</div>
				<div class="d-flex align-items-center justify-content-center">
					{#
					La leyenda que aparece debajo de esta linea de código debe mantenerse
					con las mismas palabras y con su apropiado link a Tienda Nube;
					como especifican nuestros términos de uso: http://www.tiendanube.com/terminos-de-uso .
					Si quieres puedes modificar el estilo y posición de la leyenda para que se adapte a
					tu sitio. Pero debe mantenerse visible para los visitantes y con el link funcional.
					Os créditos que aparece debaixo da linha de código deverá ser mantida com as mesmas
					palavras e com seu link para Nuvem Shop; como especificam nossos Termos de Uso:
					http://www.nuvemshop.com.br/termos-de-uso. Se você quiser poderá alterar o estilo
					e a posição dos créditos para que ele se adque ao seu site. Porém você precisa
					manter visivél e com um link funcionando.
					#}
					<div>{{ new_powered_by_link }}</div>

					<a href="https://admake.com.br" title="Desenvolvido por Admake" target="_blank">
						<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="68" height="14" viewBox="0 0 68 14">
							<defs>
								<pattern id="pattern" preserveAspectRatio="none" width="100%" height="100%" viewBox="0 0 594 120">
									<image width="594" height="120" xlink:href="data:image/png;base64,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"/>
								</pattern>
							</defs>
							<rect id="Imagem_157" data-name="Imagem 157" width="68" height="14" fill="url(#pattern)"/>
						</svg>
					</a>
				</div>
			</div>
		</div>
	</div>
</footer>