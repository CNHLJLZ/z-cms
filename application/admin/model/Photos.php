<?php
/**
 * Created by Lee_Phper.
 * User: Administrator
 * Date: 2019/4/11
 * Time: 11:19
 */

namespace app\admin\model;
use app\admin\common\model\BaseModel;
class Photos extends BaseModel
{
    protected $table = 'lz_photos';
    protected $pk = 'id';
}