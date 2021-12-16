{% embed "snipplets/page-header.tpl" with {'breadcrumbs': true} %}
	{% block page_header_text %}{{ page.name }}{% endblock page_header_text %}
{% endembed %}

{# Institutional page  #}

<section class="user-content my-5">
	<div class="container">
		<div class="row justify-content-md-center">
			<div class="col-md-8">
				<div class="page-description-text">
					{{ page.content }}
				</div>
			</div>
		</div>
	</div>
</section>
