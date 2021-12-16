<section class="js-home-slider-container section-slider d-none d-md-block {% if not settings.slider or settings.slider is empty %} hidden {% endif %}" data-store="slider-main">
	<div class="js-home-slider swiper-container swiper-container-horizontal">
		<div class="swiper-wrapper">
			{% for slide in settings.slider %}
				<div class="swiper-slide slide-container">
					{% if slide.link %}
						<a href="{{ slide.link }}" aria-label="{{ 'Carrusel' | translate }} {{ loop.index }}">
					{% endif %}
						<div class="slider-slide">
							<img src="{{ slide.image | static_url | settings_image_url('tiny') }}" data-src="{{ slide.image | static_url | settings_image_url('1080p') }}" class="slider-image blur-up-big swiper-lazy" data-sizes="auto" alt="{{ 'Carrusel' | translate }} {{ loop.index }}"/>
						</div>
					{% if slide.link %}
						</a>
					{% endif %}
				</div>
			{% endfor %}
		</div>
		<div class="js-swiper-home-pagination swiper-pagination swiper-pagination-bullets swiper-pagination-white">
			{% if settings.slider > 1 and not params.preview %}
				{% for slide in settings.slider %}
					<span class="swiper-pagination-bullet"></span>
				{% endfor %}
			{% endif %}
		</div>
		<div class="js-swiper-home-prev swiper-button-prev d-none d-md-block">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-w-8 icon-lg svg-icon-invert"} %}</div>
		<div class="js-swiper-home-next swiper-button-next d-none d-md-block">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-w-8 icon-lg svg-icon-invert"} %}</div>
	</div>
</section>


<section class="js-home-slider-container section-slider d-block d-md-none {% if not settings.slider_mobile or settings.slider_mobile is empty %} hidden {% endif %}" data-store="slider-main">
	<div class="js-home-slider swiper-container swiper-container-horizontal">
		<div class="swiper-wrapper">
			{% for slide in settings.slider_mobile %}
				<div class="swiper-slide slide-container">
					{% if slide.link %}
						<a href="{{ slide.link }}" aria-label="{{ 'Carrusel' | translate }} {{ loop.index }}">
					{% endif %}
						<div class="slider-slide">
							<img src="{{ slide.image | static_url | settings_image_url('tiny') }}" data-src="{{ slide.image | static_url | settings_image_url('1080p') }}" class="slider-image blur-up-big swiper-lazy" data-sizes="auto" alt="{{ 'Carrusel' | translate }} {{ loop.index }}"/>
						</div>
					{% if slide.link %}
						</a>
					{% endif %}
				</div>
			{% endfor %}
		</div>
		<div class="js-swiper-home-pagination swiper-pagination swiper-pagination-bullets swiper-pagination-white">
			{% if settings.slider_mobile > 1 and not params.preview %}
				{% for slide in settings.slider_mobile %}
					<span class="swiper-pagination-bullet"></span>
				{% endfor %}
			{% endif %}
		</div>
		<div class="js-swiper-home-prev swiper-button-prev d-none d-md-block">{% include "snipplets/svg/chevron-left.tpl" with {svg_custom_class: "icon-inline icon-w-8 icon-lg svg-icon-invert"} %}</div>
		<div class="js-swiper-home-next swiper-button-next d-none d-md-block">{% include "snipplets/svg/chevron-right.tpl" with {svg_custom_class: "icon-inline icon-w-8 icon-lg svg-icon-invert"} %}</div>
	</div>
</section>