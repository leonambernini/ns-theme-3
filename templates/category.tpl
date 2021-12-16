{% set has_filters = insta_colors|length > 0 or other_colors|length > 0 or size_properties_values|length > 0 or variants_properties|length > 0 %}

{% set show_filters = settings.product_filters and (filter_categories or insta_colors or other_colors or size_properties_values or variants_properties) %}

{# Only remove this if you want to take away the theme onboarding advices #}
{% set show_help = not has_products %}
{% paginate by 12 %}


<section class="category-header">
	<div class="container">
		<div class="row">
			<div class="col text-center">
				{% if (category.images is not empty) or ("banner-products.jpg" | has_custom_image) %}
					{% include 'snipplets/category-banner.tpl' %}
				{% endif %}
			</div>
		</div>
	</div>
</section>


{% if not show_help %}
<section class="category-body">
	<div class="container">

		<div class="category-title h1 d-block d-lg-none">{{ category.name }}</div>

		<div class="js-category-controls-prev category-controls-sticky-detector"></div>
		<div class="js-category-controls row align-items-center mb-md-3 category-controls">
			<div class="col-12 col-lg-6 d-none d-lg-block">
				{% include 'snipplets/breadcrumbs.tpl' with {iscategory: true} %}
			</div>
			{% if products %}
				{% set columns = settings.grid_columns %}
				<div class="col-6 d-block d-lg-none">
				{% if show_filters %}
					<a href="#" class="js-modal-open filter-link" data-toggle="#nav-filters">
						{{ 'Filtrar' | t }} {% include "snipplets/svg/filter.tpl" with {svg_custom_class: "icon-inline icon-w-16"} %} 
					</a>		   
					{% embed "snipplets/modal.tpl" with{modal_id: 'nav-filters', modal_class: 'filters modal-docked-small', modal_position: 'left', modal_transition: 'slide', modal_width: 'full'} %}
						{% block modal_head %}
							{{'Filtros' | translate }}
						{% endblock %}
						{% block modal_body %}
							{% snipplet "grid/categories.tpl" %}
							{% snipplet "grid/filters.tpl" %}
							<div class="js-filters-overlay filters-overlay" style="display: none;">
								<div class="filters-updating-message">
									<h3 class="js-applying-filter" style="display: none;">{{ 'Aplicando filtro...' | translate }}</h3>
									<h3 class="js-removing-filter" style="display: none;">{{ 'Borrando filtro...' | translate }}</h3>
								</div>
							</div>
						{% endblock %}
					{% endembed %}
				{% endif %}
				</div>
				<div class="col-6 text-right">
					{% include 'snipplets/grid/sort-by.tpl' %}
				</div>
			{% endif %}
		</div>
		<div class="row">
			{% include "snipplets/grid/filters.tpl" with {applied_filters: true} %}
		</div>

		<div class="row">

			{% if show_filters %}
			<div class="category-filter-desktop col-3 d-none d-lg-block">

				<h1 class="category-title">{{ category.name }}</h1>

				<div class="category-filter-desktop-border">
					{% snipplet "grid/categories.tpl" %}
					{% snipplet "grid/filters.tpl" %}
					<div class="js-filters-overlay filters-overlay" style="display: none;">
						<div class="filters-updating-message">
							<h3 class="js-applying-filter" style="display: none;">{{ 'Aplicando filtro...' | translate }}</h3>
							<h3 class="js-removing-filter" style="display: none;">{{ 'Borrando filtro...' | translate }}</h3>
						</div>
					</div>
				</div>
			</div>
			{% endif %}

			<div class="category-showcase col-12 {% if show_filters %}col-lg-9{% endif %}">

				{% if products %}
					<div class="js-product-table row" data-store="category-grid-{{ category.id }}">
						{% include 'snipplets/product_grid.tpl' with { show_filters: show_filters } %}
					</div>
					{% if pages.current == 1 and not pages.is_last %}
						<div class="text-center mt-5 mb-5">
							<a class="js-load-more btn btn-primary">
								<span class="js-load-more-spinner" style="display:none;">{% include "snipplets/svg/sync-alt.tpl" with {svg_custom_class: "icon-inline icon-spin"} %}</span>
								{{ 'Mostrar más productos' | t }}
							</a>
						</div>
						<div id="js-infinite-scroll-spinner" class="mt-5 mb-5 text-center w-100" style="display:none">
							{% include "snipplets/svg/sync-alt.tpl" with {svg_custom_class: "icon-inline icon-3x svg-icon-text icon-spin"} %} 
						</div>
					{% endif %}
				{% else %}
					<p class="text-center">
						{{(has_filters ? "No tenemos productos en esas variantes. Por favor, intentá con otros filtros." : "Próximamente") | translate}}
					</p>
				{% endif %}

			</div>

		</div>
		
	</div>
</section>
{% elseif show_help %}
	{# Category Placeholder #}
{% endif %}