<?php echo $header; ?>
<div id="container" class="container j-container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li itemscope itemtype="http://data-vocabulary.org/Breadcrumb"><a href="<?php echo $breadcrumb['href']; ?>" itemprop="url"><span itemprop="title"><?php echo $breadcrumb['text']; ?></span></a></li>
    <?php } ?>
  </ul>
  <?php if ($attention) { ?>
  <div class="alert alert-info information"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger warning"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?><?php echo $column_right; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> sc-page">
      <h1 class="heading-title"><?php echo $heading_title; ?>
        <?php if ($weight) { ?>
        &nbsp;(<?php echo $weight; ?>)
        <?php } ?>
      </h1>
      <?php echo $content_top; ?>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="table-responsive cart-info">
          <table class="table table-bordered">
            <thead>
              <tr>
                <td class="text-center image"><?php echo $column_image; ?></td>
                <td class="text-left name"><?php echo $column_name; ?></td>
                <td class="text-left model"><?php echo $column_model; ?></td>
                <td class="text-left quantity"><?php echo $column_quantity; ?></td>
                <td class="text-right price"><?php echo $column_price; ?></td>
                <td class="text-right total"><?php echo $column_total; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $product) { ?>
              <tr>
                <td class="text-center image"><?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                  <?php } ?></td>
                <td class="text-left name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                  <?php if (!$product['stock']) { ?>
                  <span class="text-danger">***</span>
                  <?php } ?>
                  <?php if ($product['option']) { ?>
                  <?php foreach ($product['option'] as $option) { ?>
                  <br />
                  <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                  <?php } ?>
                  <?php } ?>
                  <?php if ($product['reward']) { ?>
                  <br />
                  <small><?php echo $product['reward']; ?></small>
                  <?php } ?>
                  <?php if ($product['recurring']) { ?>
                  <br />
                  <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                  <?php } ?></td>
                <td class="text-left model"><?php echo $product['model']; ?></td>
                <td class="text-left quantity"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="quantity[<?php echo $product[version_compare(VERSION, '2.1', '<') ? 'key' : 'cart_id']; ?>]" value="<?php echo $product['quantity']; ?>" size="1" class="form-control" />
                    <span class="input-group-btn">
                    <button type="submit" data-toggle="tooltip" title="<?php echo $button_update; ?>" class="btn btn-primary"><i class="fa fa-refresh"></i></button>
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="cart.remove('<?php echo $product[version_compare(VERSION, '2.1', '<') ? 'key' : 'cart_id']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
                <td class="text-right price"><?php echo $product['price']; ?></td>
                <td class="text-right total"><?php echo $product['total']; ?></td>
              </tr>
              <?php } ?>
              <?php foreach ($vouchers as $vouchers) { ?>
              <tr>
                <td></td>
                <td class="text-left name"><?php echo $vouchers['description']; ?></td>
                <td class="text-left"></td>
                <td class="text-left quantity"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                    <span class="input-group-btn"><button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?php echo $vouchers['key']; ?>');"><i class="fa fa-times-circle"></i></button></span></div></td>
                <td class="text-right price"><?php echo $vouchers['amount']; ?></td>
                <td class="text-right total"><?php echo $vouchers['amount']; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </form>
      <div class="action-area">
        <?php if (version_compare(VERSION, '2.2', '<')): ?>
        <?php if ($coupon || $voucher || $reward || $shipping) { ?>
        <h3><?php echo $text_next; ?></h3>
        <p><?php echo $text_next_choice; ?></p>
        <div class="panel-group" id="accordion"><?php echo $coupon; ?><?php echo $voucher; ?><?php echo $reward; ?><?php echo $shipping; ?></div>
        <?php } ?>
        <?php else: ?>
        <?php if ($modules) { ?>
        <h3><?php echo $text_next; ?></h3>
        <p><?php echo $text_next_choice; ?></p>
        <div class="panel-group" id="accordion">
          <?php foreach ($modules as $module) { ?>
          <?php echo $module; ?>
          <?php } ?>
        </div>
        <?php } ?>
        <?php endif; ?>
        <div class="row">
          <div class="col-sm-4 col-sm-offset-8 cart-total">
            <table class="table table-bordered" id="total">
              <?php foreach ($totals as $total) { ?>
              <tr>
                <td class="text-right right"><strong><?php echo $total['title']; ?>:</strong></td>
                <td class="text-right right"><?php echo $total['text']; ?></td>
              </tr>
              <?php } ?>
            </table>
          </div>
        </div>
        <div class="buttons">
          <div class="pull-left"><a href="<?php echo $continue; ?>" class="btn-default button"><?php echo $button_shopping; ?></a></div>
          <div class="pull-right"><a href="<?php echo $checkout; ?>" class="btn-primary button"><?php echo $button_checkout; ?></a></div>
        </div>
      </div>
      <?php echo $content_bottom; ?></div>
    </div>
</div>
<?php echo $footer; ?> 
