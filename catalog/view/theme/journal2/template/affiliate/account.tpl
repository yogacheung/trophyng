<?php echo $header; ?>
<div id="container" class="container j-container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"><span itemprop="title"><?php echo $breadcrumb['text']; ?></span></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success success"><i class="fa fa-check-circle"></i> <?php echo $success; ?></div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?><?php echo $column_right; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h2 class="secondary-title"><?php echo $text_my_account; ?></h2>
      <div class="content">
      <ul class="list-unstyled">
        <li><a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a></li>
        <li><a href="<?php echo $password; ?>"><?php echo $text_password; ?></a></li>
        <li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
      </ul>
      </div>
      <h2 class="secondary-title"><?php echo $text_my_tracking; ?></h2>
      <div class="content">
      <ul class="list-unstyled">
        <li><a href="<?php echo $tracking; ?>"><?php echo $text_tracking; ?></a></li>
      </ul>
      </div>
      <h2 class="secondary-title"><?php echo $text_my_transactions; ?></h2>
      <div class="content">
      <ul class="list-unstyled">
        <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
      </ul>
      </div>
      <?php echo $content_bottom; ?></div>
    </div>
</div>
<?php echo $footer; ?>
