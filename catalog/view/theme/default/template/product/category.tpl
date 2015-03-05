<!-- Insert before < ?php echo $footer; ?> -->
<!-- REES46 Category Tracking Begin -->
<script type="text/javascript">
  var REES46CurrentCategory = '<?php echo $this->request->get['path']; ?>';
  REES46CurrentCategory = REES46CurrentCategory.split('_').pop();
</script>
<!-- REES46 Category Tracking End -->
