    <footer>
	<a href="[% product_url %]?version=[% version %]" target="_blank">[% product %] [% version %]</a>
	&nbsp;|&nbsp;
	<a href="?rm=overview">[% "Return to Overview" | l10n %]</a>
    </footer>
  </div> <!--! end of #container -->

  <!-- Javascript at the bottom for fast page loading -->
  <script type="text/javascript" language="javascript" src="[% media_prefix %]/js/libs/jquery-1.5.1.js?v=1"></script>
  <script type="text/javascript" language="javascript" src="[% media_prefix %]/js/libs/jquery-ui-1.8.12.custom.js?v=1"></script>
  <script type="text/javascript" language="javascript" src="[% media_prefix %]/js/libs/jquery.dataTables.js?v=1"></script>
  
  <!-- scripts concatenated and minified via ant build script-->
  <!-- <script src="[% media_prefix %]/js/plugins.js"></script> -->
  <script type="text/javascript" language="javascript" src="[% media_prefix %]/js/script.js?v=1"></script>
  <!-- end concatenated and minified scripts-->
	[% FOREACH message IN messages %]
	[% IF loop.first %]
	<div id="dialog-message" title="Notifications">
	[% END %]
		<div class="ui-widget">
			[% IF message.severity == "error" %]
			<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;"> 
				<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span>
			[% ELSE %]
			<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em;"> 
				<p><span class="ui-icon ui-icon-info" style="float: left; margin-right: .3em;"></span>
			[% END %] 
				<strong>[% message.severity | ucfirst %]:</strong> [% message.loc %].</p>
			</div>
		</div>
	[% IF loop.last %]
	</div>
	<script type="text/javascript">
		$(function() {
			$("#dialog-message").dialog({
				modal: true,
				width: 600,
				position: 'center',
				buttons: {
					Ok: function() {
						$(this).dialog("close");
					}
				}
			});
		});
	</script>
	[% END %]
	[% END %]
  
  <!--[if lt IE 7 ]>
    <script src="[% media_prefix %]/js/libs/dd_belatedpng.js"></script>
    <script type="text/javascript"> DD_belatedPNG.fix('img, .png_bg'); //fix any <img> or .png_bg background-images</script>
  <![endif]-->
  
</body>
</html>
