{% if settings.ad_bar and ( settings.ad_text != '' or settings.ad_text_center != '' or settings.ad_bar_social ) %}
	<section class="section-advertising d-none d-md-block">
		<div class="container">
			<div class="d-flex {% if settings.ad_text or settings.ad_bar_social %}justify-content-between{% else %}justify-content-center{% endif %} align-items-center">
				{% if settings.ad_text %}
					<div class="section-advertising-text">
						{{ settings.ad_text | raw }}
					</div>
				{% endif %}

				{% if settings.ad_text_center %}
					<div class="section-advertising-text d-none d-lg-block">
						{{ settings.ad_text_center | raw }}
					</div>
				{% endif %}
				
				{% if settings.ad_bar_social %}
					<div class="section-advertising-social">
						{% include "snipplets/social/social-links.tpl" %}
					</div>
				{% endif %}
			</div>
		</div>
	</section>
{% endif %}       	