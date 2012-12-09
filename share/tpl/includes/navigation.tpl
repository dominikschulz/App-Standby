<nav id="topNav">
	[% FOREACH line IN groups %]
        <!-- <li><a href="?rm=overview&group_id=[% line.id %]">[% line.name %]</a></li> -->
        [% IF loop.first %]
	<ul>
	[% END %]
		<li><a[% IF line.id == group_id %] class="current"[% END %] href="?rm=overview&group_id=[% line.id %]">[% line.name %]</a>
			<ul>
				<li><a href="?rm=list_contacts&group_id=[% line.id %]">Contacts</a></li>
				<li><a href="?rm=list_config&group_id=[% line.id %]">Config</a></li>
				<li><a href="?rm=list_services&group_id=[% line.id %]">Services</a></li>
			</ul>
		</li>
	[% IF loop.last %]
		<li><a href="?rm=list_groups">[% "Manage Groups" | l10n %]</a></li>
	</ul>
	[% END %]
	[% END %]
</nav>
