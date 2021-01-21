<?php
header('Content-type:text/html;charset=utf-8');
include_once 'classes.php';
$Link=new Link('localhost','root','','sklad');
include_once 'header.php'; ?>

<?php
session_start();
 if($Link->LoginIsExist($_SESSION['user']) != "OK"){
 header("Location: form.php");    
exit; 
}
?>



<div id="content">


 

   <?php
   
	$page = 1;
	$itemsByPage = 5;
	if(isset($_GET['page'])){
	 
		$page = $_GET['page'];
	}
	if(isset($_GET['itemsByPage'])){
	 
		$itemsByPage = $_GET['itemsByPage'];
	}
   
   $warehouse=$Link->GetItemsByPage($page, $itemsByPage);
   
   if ($warehouse==FALSE) :
            echo '<div id="table">Нет ни одного товара</div>';
     else:?></h1>
	 
	 <p>
		<?php
			if($page != 1)
			{
				$prev = $page-1;
				echo "<a href=\"sklad.php?page=1\"> << </a>";	
				echo "<a href=\"sklad.php?page=$prev\"> Пред </a>";				
			}
			echo " Страница $page ";
			if($page != $warehouse["countOfPages"])
			{
				$next = $page+1;
				$countOfPages = $warehouse["countOfPages"];
				echo "<a href=\"sklad.php?page=$next\"> След </a>";
				echo "<a href=\"sklad.php?page=$countOfPages\"> >> </a>";				
			}
			
		?>

	 </p>
    <div class="table">
        <div class="row">
          <div class="name">Наименование товара</div>
          <div class="type">Тип</div>
          <div class="date">Дата добавления</div>
          <div class="count">Количество</div>
        </div> 
        <?php
            
                foreach ($warehouse["array"] as $item): ?>
        <div class="row">
			<div class="name"><?php echo $item->GetName();?> </div>
			<div class="type"><?php echo $item->GetType();?></div>             
			<div class="date"><?php echo $item->GetDate();?></div>
			<div class="count"><?php echo $item->GetCount();?></div>
            
            <input type="submit" class="delitem" value="Удалить" name="<?php echo $item->GetID(); ?>" />        
        </div>
       
        <?php endforeach;?>
        <div><h3 class="right">Всего: <?php echo $Link->GetAllCount();?> товаров</h3> </div>
        <?php endif;?>
        <form method="post" action="add.php" class="additem">
             <h3>Новый товар</h3>
             <label>Наименование:</label>
             <input type="text" name="name" />
        
              <label>Количество:</label>
             <input type="text" name="count" />
                  <label>Тип:</label>
             
             <?php $types=$Link->GetTypes();?>
             <select name="type">
                 <?php foreach ( $types as $type ) : ?>
                 <option value="<?php echo $type['id']?>"><?php echo $type['type_name']?></option>
                 <?php endforeach;?>
             </select>
             <input type="submit"  name="addgood" value="Добавить" />
</form>
              
    </div>
    
 
<form method="post" class="addtype" action="addtype.php" >
    <h3>Добавить тип товара</h3>
    <input name="type_name" type="text"/>
    <input type="submit" value="Добавить" />
</form>
<?php
 ?>
</div>
<form method="get" action="del.php" id="delform">
    <input type="hidden" name="delid" id="delid" val=""/>
</form>
<a href="logout.php">Выход</a>
<?php include_once 'footer.php';
?>

