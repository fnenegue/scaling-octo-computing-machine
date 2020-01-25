a:33:{i:0;a:3:{i:0;s:14:"document_start";i:1;a:0:{}i:2;i:0;}i:1;a:3:{i:0;s:6:"plugin";i:1;a:4:{i:0;s:13:"struct_output";i:1;a:1:{s:3:"pos";i:0;}i:2;i:5;i:3;s:0:"";}i:2;i:0;}i:2;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:0;}i:3;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:45:"<?php
namespace dokuwiki\plugin\struct\types;";}i:2;i:1;}i:4;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:46;}i:5;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:46;}i:6;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:202:"use dokuwiki\plugin\struct\meta\DateFormatConverter;
use dokuwiki\plugin\struct\meta\QueryBuilder;
use dokuwiki\plugin\struct\meta\QueryBuilderWhere;
use dokuwiki\plugin\struct\meta\ValidationException;";}i:2;i:48;}i:7;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:250;}i:8;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:250;}i:9;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:29:"class DateTime extends Date {";}i:2;i:252;}i:10;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:282;}i:11;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:110:"  protected $config = array(
      'format' => '', // filled by constructor
      'prefilltoday' => false
  );";}i:2;i:282;}i:12;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:335:"  /**
   * DateTime constructor.
   *
   * @param array|null $config
   * @param string $label
   * @param bool $ismulti
   * @param int $tid
   */
  public function __construct($config = null, $label = '', $ismulti = false, $tid = 0) {
      global $conf;
      $this->config['format'] = DateFormatConverter::toDate($conf['dformat']);";}i:2;i:402;}i:13;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:63:"      parent::__construct($config, $label, $ismulti, $tid);
  }";}i:2;i:761;}i:14;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:403:"  /**
   * Return the editor to edit a single value
   *
   * @param string $name     the form name where this has to be stored
   * @param string $rawvalue the current value
   * @param string $htmlID
   *
   * @return string html
   */
  public function valueEditor($name, $rawvalue, $htmlID) {
      if($this->config['prefilltoday'] && !$rawvalue) {
          $rawvalue = date('Y-m-d H:i:s');
      }";}i:2;i:830;}i:15;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:314:"      $params = array(
          'name' => $name,
          'value' => $rawvalue,
          'class' => 'struct_datetime',
          'type' => 'datetime-local', // HTML5 datetime picker
          'id' => $htmlID,
      );
      $attributes = buildAttributes($params, true);
      return "<input $attributes />";
  }";}i:2;i:1261;}i:16;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:481:"  /**
   * Validate a single value
   *
   * This function needs to throw a validation exception when validation fails.
   * The exception message will be prefixed by the appropriate field on output
   *
   * @param string|array $rawvalue
   * @return string
   * @throws ValidationException
   */
  public function validate($rawvalue) {
      $rawvalue = trim($rawvalue);
      list($date, $time) = explode(' ', $rawvalue, 2);
      $date = trim($date);
      $time = trim($time);";}i:2;i:1597;}i:17;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:195:"      list($year, $month, $day) = explode('-', $date, 3);
      if(!checkdate((int) $month, (int) $day, (int) $year)) {
          throw new ValidationException('invalid datetime format');
      }";}i:2;i:2110;}i:18;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:259:"      list($h, $m, $s) = explode(':', $time, 3);
      $h = (int) $h;
      $m = (int) $m;
      $s = (int) $s;
      if($h < 0 || $h > 23 || $m < 0 || $m > 59 || $s < 0 || $s > 59) {
          throw new ValidationException('invalid datetime format');
      }";}i:2;i:2315;}i:19;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:89:"      return sprintf("%d-%02d-%02d %02d:%02d:%02d", $year, $month, $day, $h, $m, $s);
  }";}i:2;i:2590;}i:20;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:238:"  /**
   * @param QueryBuilder $QB
   * @param string $tablealias
   * @param string $colname
   * @param string $alias
   */
  public function select(QueryBuilder $QB, $tablealias, $colname, $alias) {
      $col = "$tablealias.$colname";";}i:2;i:2685;}i:21;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:396:"      // when accessing the revision column we need to convert from Unix timestamp
      if(is_a($this->context,'dokuwiki\plugin\struct\meta\RevisionColumn')) {
          $rightalias = $QB->generateTableAlias();
          $QB->addLeftJoin($tablealias, 'titles', $rightalias, "$tablealias.pid = $rightalias.pid");
          $col = "DATETIME($rightalias.lastrev, 'unixepoch', 'localtime')";
      }";}i:2;i:2941;}i:22;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:48:"      $QB->addSelectStatement($col, $alias);
  }";}i:2;i:3351;}i:23;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:320:"  /**
   * @param QueryBuilderWhere $add
   * @param string $tablealias
   * @param string $colname
   * @param string $comp
   * @param string|\string[] $value
   * @param string $op
   */
  public function filter(QueryBuilderWhere $add, $tablealias, $colname, $comp, $value, $op) {
      $col = "$tablealias.$colname";";}i:2;i:3405;}i:24;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:427:"      // when accessing the revision column we need to convert from Unix timestamp
      if(is_a($this->context,'dokuwiki\plugin\struct\meta\RevisionColumn')) {
          $QB = $add->getQB();
          $rightalias = $QB->generateTableAlias();
          $col = "DATETIME($rightalias.lastrev, 'unixepoch', 'localtime')";
          $QB->addLeftJoin($tablealias, 'titles', $rightalias, "$tablealias.pid = $rightalias.pid");
      }";}i:2;i:3747;}i:25;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:356:"      /** @var QueryBuilderWhere $add Where additionional queries are added to*/
      if(is_array($value)) {
          $add = $add->where($op); // sub where group
          $op = 'OR';
      }
      foreach((array) $value as $item) {
	    $QB = $add->getQB();
          $pl = $QB->addValue($item);
          $add->where($op, "$col $comp $pl");
      }
  }";}i:2;i:4190;}i:26;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:346:"  /**
   * When sorting `%lastupdated%`, then sort the data from the `titles` table instead the `data_` table.
   *
   * @param QueryBuilder $QB
   * @param string $tablealias
   * @param string $colname
   * @param string $order
   */
  public function sort(QueryBuilder $QB, $tablealias, $colname, $order) {
      $col = "$tablealias.$colname";";}i:2;i:4570;}i:27;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:277:"      if(is_a($this->context,'dokuwiki\plugin\struct\meta\RevisionColumn')) {
          $rightalias = $QB->generateTableAlias();
          $QB->addLeftJoin($tablealias, 'titles', $rightalias, "$tablealias.pid = $rightalias.pid");
          $col = "$rightalias.lastrev";
      }";}i:2;i:4938;}i:28;a:3:{i:0;s:12:"preformatted";i:1;a:1:{i:0;s:41:"      $QB->addOrderBy("$col $order");
  }";}i:2;i:5227;}i:29;a:3:{i:0;s:6:"p_open";i:1;a:0:{}i:2;i:5227;}i:30;a:3:{i:0;s:5:"cdata";i:1;a:1:{i:0;s:1:"}";}i:2;i:5275;}i:31;a:3:{i:0;s:7:"p_close";i:1;a:0:{}i:2;i:5275;}i:32;a:3:{i:0;s:12:"document_end";i:1;a:0:{}i:2;i:5275;}}