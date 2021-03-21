<!doctype html>
<html>
<head>
  <meta charset="utf-8">

  <title><?php echo $title; ?></title>

  <script type="text/javascript">
  </script>

  <style type="text/css">
  </style>

</head>

<body>
    <h1><?php echo $introduction; ?></h1>
    
    <?php foreach($products as $product){?> 

    <h2><?php echo $product['title'] ?> </h2>
    <p> 
    <?php echo $product['prix'] ?> 
    </p>
    <p> 
    <?php echo $product['alcool'] ?> 
    </p> 
    <p> 
    <?php echo $product['description'] ?> 
    </p> 
    <?php
    } 
    ?>
</body>

</html>