{% if settings.mini_banners_show and settings.mini_banners and not settings.mini_banners is empty %}
<section class="home-mini-banners section-home-mini-banners" data-store="mini-banners-main">
    <div class="container">
        {% if settings.mini_banners_title %}
            <div class="row">
                <div class="col-12 text-center">
                    <h2 class="showcase-title">{{ settings.mini_banners_title}}</h2>
                </div>
            </div>
        {% endif %}
        <div class="row">
        {% for slide in settings.mini_banners %}
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