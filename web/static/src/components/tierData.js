import React, {useContext } from "react";
import { Typography, withStyles } from "@material-ui/core";
import { Link, withRouter } from "react-router-dom";
import MUIDataTable from "mui-datatables";
import { createMuiTheme, MuiThemeProvider } from "@material-ui/core/styles"
import {store} from '../Store'




const header = {
  display:"flex",
  justifyContent:"center",
  color: "white",
  fontFamily: 'Pathway Gothic One, sans-serif'
};

const linkColumn = {
  fontFamily: 'Pathway Gothic One, sans-serif',
  fontSize:'110%',
  width:'700px',
  textDecoration:'none'
};
const columns = [
  {
    name: "access",
    label: "Access",
    options: {
      filter: true,
      sort: true
    }
  },
  {
    name: "duration",
    label: "Duration",
    options: {
      filter: true,
      sort: true
    }
  },
  {
    name: "userType",
    label: "User Type",
    options: {
      filter: true,
      sort: true
    }
  },
  {
    name: "numOfRecords",
    label: "Number Of Records",
    options: {
      filter: true,
      sort: true
    }
  },
  {
    name: "cost",
    label: "Cost",
    options: {
      filter: true,
      sort: true
    }
  },
  {
    name: "renewable",
    label: "Re-newable",
    options: {
      filter: true,
      sort: true
    }
  },
  {
    name: "trial",
    label: "Trial",
    options: {
      filter: true,
      sort: true
    }
  }
];

const generateData = () => {
      const GlobalContext =  useContext(store)
      const {state,dispatch} = GlobalContext
      
    return(
      
 [
  {
    access: (
      <Link
        onClick={()=> dispatch({type:'UPDATE_TIER_SELECTION',
        payload:{
          tierName: "Basic",
          price: "100",
          userType: "Single",
          duration: "7 Day"
        }})}

        style={linkColumn}

        to={{ pathname: "/acquire"}}>
        Basic
      </Link>
    ),

    duration: "7 Day",
    userType: "Single",
    cost: "$100",
    numOfRecords: "25",
    renewable: "Yes",
    trial: "Yes"
  },
  {
    access: (
      <Link
      onClick={()=> dispatch({type:'UPDATE_TIER_SELECTION',
      payload:{
        tierName: "Pro",
        price: "149",
        userType: "Single",
        duration: "7 Day"
      }})}
      style={linkColumn}
        to={{
          pathname: "/acquire"}}>
        Pro
      </Link>
    ),

    duration: "7 Days",
    userType: "Single",
    cost: "$149",
    numOfRecords: "50",
    renewable: "Yes",
    trial: "Yes"
  },
  {
    access: (
      <Link
      onClick={()=> dispatch({type:'UPDATE_TIER_SELECTION',
      payload:{
        tierName: "Basic",
        price: "500",
        userType: "Single",
        duration: "1 Month"
      }})}
      style={linkColumn}
        to={{ pathname: "/acquire"}}>
        Basic
      </Link>
    ),

    duration: "1 Month",
    userType: "Single",
    cost: "$500",
    numOfRecords: "Entire Database",
    renewable: "Yes",
    trial: "Yes"
  },
  {
    access: (
      <Link
      onClick={()=> dispatch({type:'UPDATE_TIER_SELECTION',
      payload:{
        tierName: 'PRO',
        price: "1000",
        userType: "Single",
        duration: "1 Month"
      }})}
      style={linkColumn}
        to={{
          pathname: "/acquire" }}>
        Pro
      </Link>
    ),

    duration: "1 Month",
    userType: "Single",
    cost: "$1000",
    numOfRecords: "Entire Database",
    renewable: "Yes",
    trial: "No"
  },
  {
    access: (
      <Link
      onClick={()=> dispatch({type:'UPDATE_TIER_SELECTION',
      payload:{
        tierName: "Basic",
        price: "1250",
        userType: "Single",
        duration: "12 Months"
      }})}
      style={linkColumn}
        to={{
          pathname: "/acquire" }}>
        Basic
      </Link>
    ),

    duration: "12 Month",
    userType: "Single",
    cost: "$1250",
    numOfRecords: "Entire Database",
    renewable: "Yes",
    trial: "No"
  },
  {
    access: (
      <Link
      onClick={()=> dispatch({type:'UPDATE_TIER_SELECTION',
      payload:{
        tierName: "PRO",
        price: "3500",
        userType: "Single",
        duration: "12 Months"
      }})}
      style={linkColumn}
        to={{
          pathname: "/acquire"}} >
        Pro
      </Link>
    ),
    duration: "12 Month",
    userType: "Single",
    cost: "$3500",
    numOfRecords: "Entire Database",
    renewable: "Yes",
    trial: "No"
  },
  {
    access: (
      <Link
      onClick={()=> dispatch({type:'UPDATE_TIER_SELECTION',
      payload:{
        tierName: "Basic",
        price: "250",
        userType: "MULTI (6 MAX)",
        duration: "7 Day"
      }})}
      style={linkColumn}
        to={{ pathname: "/acquire"}}>
        Basic
      </Link>
    ),
    duration: "7 Day",
    userType: "Multi (6 Max)",
    cost: "$250",
    numOfRecords: "50",
    renewable: "Yes",
    trial: "Yes"
  },
  {
    access: (
      <Link
      onClick={()=> dispatch({type:'UPDATE_TIER_SELECTION',
      payload:{
        tierName: "PRO",
        price: "750",
        userType: "MULTI",
        duration: "7 Day"
      }})}
      style={linkColumn}
        to={{pathname: "/acquire"}}>
        Pro
      </Link>
    ),
    duration: "7 Day",
    userType: "Multi (6 Max)",
    cost: "$750",
    numOfRecords: "25",
    renewable: "Yes",
    trial: "Yes"
  },
  {
    access: (
      <Link
      onClick={()=> dispatch({type:'UPDATE_TIER_SELECTION',
      payload:{
        tierName: "Basic",
        price: "1250",
        userType: "MULTI",
        duration: "1 Month"
      }})}
      style={linkColumn}
        to={{ pathname: "/acquire"}}>
        Basic
      </Link>
    ),
    duration: "1 Month",
    userType: "Multi (6 Max)",
    cost: "$1250",
    numOfRecords: "Entire Database",
    renewable: "Yes",
    trial: "No"
  },
  {
    access: (
      <Link
      onClick={()=> dispatch({type:'UPDATE_TIER_SELECTION',
      payload:{
        tierName: "PRO",
        price: "2750",
        userType: "MULTI",
        duration: "1 Month"
      }})}
      style={linkColumn}
        to={{
          pathname: "/acquire" }}
      >
        Pro
      </Link>
    ),
    duration: "1 Month",
    userType: "Multi (6 Max)",
    cost: "$2750",
    numOfRecords: "Entire Database",
    renewable: "Yes",
    trial: "No"
  },
  {
    access: (
      <Link
      onClick={()=> dispatch({type:'UPDATE_TIER_SELECTION',
      payload:{
        tierName: "Basic",
        price: "3500",
        userType: "MULTI",
        duration: "12 Months"
      }})}
      style={linkColumn}
        to={{
          pathname: "/acquire",
          state: {
            tierName: "Basic",
            cost: "3500",
            userType: "Multi",
            duration: "12 Months"
          }
        }}
      >
        Basic
      </Link>
    ),
    duration: "12 Month",
    userType: "Multi (6 Max)",
    cost: "$3500",
    numOfRecords: "Entire Database",
    renewable: "Yes",
    trial: "No"
  },
  {
    access: (
      <Link
      onClick={()=> dispatch({type:'UPDATE_TIER_SELECTION',
      payload:{
        tierName: "PRO",
        price: "11500",
        userType: "MULTI",
        duration: "12 Months"
      }})}
      style={linkColumn}
        to={{ pathname: "/acquire"}}
      >
        Pro
      </Link>
    ),
    duration: "12 Month",
    userType: "Multi (6 Max)",
    cost: "$11500",
    numOfRecords: "Entire Database",
    renewable: "Yes",
    trial: "No"
  }
]

    )
}


const styles = {
  action: {
    background: "blue"
  }
};

const  TeirData = props =>{
   //Style themes
 const getMuiTheme = () =>
    createMuiTheme({
      overrides: {
        MUIDataTableToolbar: {
          root: {
            background: "#2f4c6e",
            color: "white",
            width:'100%'
          },
          actions: {
            position: "absolute"
          }
        },
        MuiPaper:{
          root:{
            maxWidth:'80vw',
            margin:'0 auto',
            overflow:'hidden',
            marginBottom:'20px',
            marginTop:'30px',
            border:'none',
            boxShadow:'none',
            
            "913":{
            
            }

           
           
          },
         
          elevation4:{
            '919':{
              boxShadow:'none',
              overflowX:'hidden',
              marginBottom:'30px',
              border:'none',
              
              
            
            }
          }
         
          },
          
        MuiSvgIcon: {
          root: {
            color: "white"
          }
        },

        MUIDataTableBodyCell: {
          root: {
            padding: "5px",
            fontFamily: 'Pathway Gothic One, sans-serif',
            fontSize:'90%'
           
          }
        },
        MUIDataTableHeadCell:{
          root:{
              fontSize:'15px',
              fontFamily: 'Pathway Gothic One, sans-serif'
            }
          
        },
        MuiInputBase:{
          root:{
            color:'lightgray',
            fontSize:'20px',
            textAlign:'right',
            position:'absolute',
            left:'18%',
            fontFamily: 'Pathway Gothic One, sans-serif',
            width:'160px'
          }
        },
        MUIDataTableFilter:{
          root:{
            width:'350px',
            maxWidth:'350px'
          }
        },
        MuiSelect:{
          select:{
            position:'relative',
            left:'5px',
            padding:'0'
          }
        },
       
        
      }
    });
 
    const { classes } = props;

    const options = {
      selectableRows: false,
      print: false,
      download: false,
      checkbox: false,
      pagination: false,
      search:true,
      elevation: 4,
      reponsive: "stacked",
      onRowClick(rowData) {
       
    
    }
  }
    
    return (
      <MuiThemeProvider theme={getMuiTheme()}>
 
        <MUIDataTable
          title={
            <Typography style={header} component="h3" variant="h3" gutterBottom>
              Tier Plans
            </Typography>
          }
          data={generateData()}
          columns={columns}
          options={options}
        />
      
      </MuiThemeProvider>
    );
  }


export default withStyles(styles)(TeirData);
