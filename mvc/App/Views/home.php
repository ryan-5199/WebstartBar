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
    
    <?php foreach($cards as $card){?> 

    <h2><?php echo $card['title'] ?> </h2> 
    <?php
    } 
    ?>
</body>

</html>