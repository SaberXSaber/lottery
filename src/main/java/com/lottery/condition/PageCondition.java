package com.lottery.condition;

import org.apache.commons.lang3.StringUtils;

/**
 * Created by IntelliJ IDEA.
 * User: guoshubo
 * Date: 2017/3/6
 * Time: 17:07
 * Description：
 */
public class PageCondition {
    public static int DEFAULT_PAGE_SIZE = 10;
    private int rows = DEFAULT_PAGE_SIZE; //行数
    private int page = 1; //当前页
    private int recordTotal = -1; //记录总数
    private int recordStart =0;
    private int recordEnd = 10;
    private int total = -1; //页码记录

    private String sord; //排序
    private String searchField;//查询字段
    private String searchString;//查询值
    private String searchOper;//查询条件

    private String sqlCondition;

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
        int recordStart = (this.getPage()-1)*rows;
        this.setRecordStart(recordStart);
        this.setRecordEnd(this.getRecordStart()+rows);
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;

    }



    public int getTotal() {
        if( this.getRecordTotal()%this.rows>0){
            return  this.getRecordTotal()/this.rows+1;
        }else {
            return this.getRecordTotal()/this.rows;
        }
    }

    public void setTotal(int total) {
       this.total =total;
    }

    public int getRecordStart() {
        return recordStart;
    }

    public void setRecordStart(int recordStart) {
        this.recordStart = recordStart;
    }

    public String getSord() {
        return sord;
    }

    public void setSord(String sord) {
        this.sord = sord;
    }

    public String getSearchField() {
        return searchField;
    }

    public void setSearchField(String searchField) {
        this.searchField = searchField;
    }

    public String getSearchString() {
        return searchString;
    }

    public void setSearchString(String searchString) {
        this.searchString = searchString;
    }

    public String getSearchOper() {
        return searchOper;
    }

    public void setSearchOper(String searchOper) {
        this.searchOper = searchOper;
    }


    public int getRecordEnd() {
        return recordEnd;
    }

    public void setRecordEnd(int recordEnd) {
        this.recordEnd = recordEnd;
    }

    public int getRecordTotal() {
        return recordTotal;
    }

    public void setRecordTotal(int recordTotal) {
        this.recordTotal = recordTotal;
    }

    public void setSqlCondition(String sqlCondition) {
        this.sqlCondition = sqlCondition;
    }

    public String getSqlCondition() {
        if(StringUtils.isNotBlank(this.getSearchOper())){
            return getsql(this.getSearchField(),this.getSearchOper(),this.getSearchString());
        }else {
            return null;
        }
    }

   /* { oper:'eq', text:'等于\u3000\u3000'},{ oper:'ne', text:'不等\u3000\u3000'},
    { oper:'lt', text:'小于\u3000\u3000'},{ oper:'le', text:'小于等于'},
    { oper:'gt', text:'大于\u3000\u3000'},{ oper:'ge', text:'大于等于'},
    { oper:'cn', text:'包含\u3000\u3000'}*/

    private String getsql(String searchField,String searchOper ,String searchString){
        String result = null;
        if("eq".equals(searchOper) || "eq" == searchOper){
            result = searchField+"= '"+searchString+"'";
        }else if("ne".equals(searchOper) || "ne" == searchOper){
            result = searchField+"!= '"+searchString+"'";
        }else if("lt".equals(searchOper) || "lt" == searchOper){
            result = searchField+"< '"+searchString+"'";
        }else if("le".equals(searchOper) || "le" == searchOper){
            result = searchField+"<= '"+searchString+"'";
        }else if("gt".equals(searchOper) || "gt" == searchOper){
            result = searchField+"> '"+searchString+"'";
        }else if("ge".equals(searchOper) || "ge" == searchOper){
            result = searchField+">= '"+searchString+"'";
        }else if("cn".equals(searchOper) || "cn" == searchOper){
            result = searchField+" like '%"+searchString+"%'";
        }
        return result;
    }

}