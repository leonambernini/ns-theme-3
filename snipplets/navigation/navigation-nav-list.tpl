{% set desktop = desktop | default(false) %}
{% set level = level | default(1) %}

{% for item in navigation %}
    {% if item.subitems %}

        {% if desktop %}

            <li class="item-with-subitems lvl-{{ level }}">
                <a href="{{ item.url }}" class="nav-list-link nav-list-link-{{ level }}">
                    {{ item.name }}
                </a>

                <div class="item-subitems-box item-subitems-box-{{ level }}">
                    {% if level == 1 and settings.banner_nav %}
                        <div class="item-subitems-content d-flex justify-content-between align-items-start">
                    {% endif %}

                        <ul class="item-subitems-list item-subitems-list-{{ level }}">
                            {% snipplet "navigation/navigation-nav-list.tpl" with navigation = item.subitems, level = level + 1 %}
                        </ul>

                    {% if level == 1 and settings.banner_nav %}
                        {% for slide in settings.banner_nav_images %}
                            {% if slide.link %}
                                {% set arr_slide_link = slide.link | split('#') %}
                                {% if arr_slide_link.1 and arr_slide_link.1 == item.name %}
                                    <div class="item-subitems-banner">
                                        <a href="{{ arr_slide_link.0 }}">
                                            <img src="{{ slide.image | static_url | settings_image_url('tiny') }}" data-src="{{ slide.image | static_url | settings_image_url('1080p') }}" class="blur-up-big lazyload" data-sizes="auto" alt="{{ item.name }}"/>
                                        </a>
                                    </div>
                                {% endif %}                                        
                            {% endif %}                                        
                        {% endfor %}
                        </div>    
                    {% endif %}
                </div>
            </li>

        {% else %}

            <li class="item-with-subitems">
                <div class="js-nav-list-toggle-accordion">
                    <a class="js-toggle-page-accordion nav-list-link" href="#">
                        {{ item.name }}
                        <span class="nav-list-arrow transition-soft">
                            {% include "snipplets/svg/chevron-down.tpl" with {svg_custom_class: "icon-inline svg-icon-text"} %}
                        </span>
                    </a>
                </div>
                <ul class="js-pages-accordion list-subitems nav-list-accordion" style="display:none;">
                    {% if item.isCategory %}
                        <li class="nav-item">
                            <a class="nav-list-link {{ item.current ? 'selected' : '' }}" href="{{ item.url }}">
                                <strong>
                                    {% if item.isRootCategory %}
                                        {{ 'Ver todos los productos' | translate }}
                                    {% else %}
                                        {{ 'Ver todo en' | translate }} {{ item.name }}
                                    {% endif %}
                                </strong>
                            </a>
                        </li>
                    {% endif %}
                    {% snipplet "navigation/navigation-nav-list.tpl" with navigation = item.subitems %}
                </ul>
            </li>

        {% endif %}
    {% else %}
        <li class="lvl-{{ level }}">
            <a class="nav-list-link nav-list-link-{{ level }}" href="{{ item.url }}">{{ item.name }}</a>
        </li>
    {% endif %}
{% endfor %}