{% if settings.mini_banners_two_show and settings.mini_banners_two and not settings.mini_banners_two is empty %}
<section class="home-mini-banners section-home-mini-banners-two" data-store="mini-banners-main">
    <div class="container">
        <div class="row">
        {% for slide in settings.mini_banners_two %}
            <div class="col-12 col-sm-4 {% if loop.index > 3 %}d-none d-md-block{% endif %}">
                {% if slide.link %}
                    <a href="{{ slide.link }}" aria-label="{{ 'Carrusel' | translate }} {{ loop.index }}">
                {% endif %}
                    <img src="{{ slide.image | static_url | settings_image_url('tiny') }}" data-src="{{ slide.image | static_url | settings_image_url('1080p') }}" class="lazyautosizes lazyload blur-up-big" data-sizes="auto" alt="{{ 'Carrusel' | translate }} {{ loop.index }}"/>
                {% if slide.link %}
                    </a>
                {% endif %}
            </div>
        {% endfor %}
        </div>
    </div>
</section>
{% endif %}