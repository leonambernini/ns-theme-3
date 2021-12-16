{% if settings.about_us and settings.about_us_description %}
<section class="about-us">
    <div class="about-us-description py-5">
        <div class="">
            <div class="{% if not has_logo %}hidden{% endif %}">
                {{ store.logo('medium') | img_tag(store.name, {class: 'logo-img  transition-soft-slow'}) | a_tag(store.url) }}
            </div>
            <div class="{% if has_logo %} hidden{% endif %}">
                <a class="logo-text h1" href="{{ store.url }}">{{ store.name }}</a>
            </div>
        </div>

        <p>{{ settings.about_us_description | raw }}</p>
    </div>
</section>
{% endif %}