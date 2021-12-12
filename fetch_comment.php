<?php

//fetch_comment.php

$connect = new PDO('mysql:host=localhost;dbname=drum_n_code','root', '');

$query = "SELECT * FROM form_comments WHERE parent_comment_id = '0' ORDER BY comment_id DESC";

$statement = $connect->prepare($query);

$statement->execute();

$result = $statement->fetchAll();
$output = '';
foreach($result as $row)
{
    $output .= '
        <div class="card">
        <div class="card-header">By <span style="font-weight:bold">'.$row["comment_sender_name"].'</span> on <span style="font-style:italic">'.$row["date"].'</span></div>
        <div class="card-body">'.$row["comment"].'</div>
        <div class="card-footer"><button type="button" class="btn btn-default reply" id="'.$row["comment_id"].'">Reply</button></div>
        </div><br>
 ';
    $output .= get_reply_comment($connect, $row["comment_id"]);
}
echo $output;

function get_reply_comment($connect, $parent_id = 0, $margin_left = 0): string
{
    $query = "SELECT * FROM form_comments WHERE parent_comment_id = '" . $parent_id .   "'";
    $output = '';
    $statement = $connect->prepare($query);
    $statement->execute();
    $result = $statement->fetchAll();
    $count = $statement->rowCount();
    if($parent_id == 0)
    {
        $margin_left = 0;
    }
    else
    {
        $margin_left = $margin_left + 48;
    }
    if($count > 0)
    {
        foreach($result as $row)
        {
            $output .= '
                <div class="card" style="margin-left:'.$margin_left.'px">
                <div class="card-header">By <span style="font-weight:bold">'.$row["comment_sender_name"].'</span> on <span style="font-style:italic">'.$row["date"].'</span></div>
                <div class="card-body">'.$row["comment"].'</div>
                <div class="card-footer" id="comment_reply"><button type="button" class="btn btn-default reply" id="'.$row["comment_id"].'">Reply</button></div>
                </div><br>
                ';
            $output .= get_reply_comment($connect, $row["comment_id"], $margin_left);
        }
    }
    return $output;
}
