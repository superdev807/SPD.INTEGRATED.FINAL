import React, { Component } from "react";
import Navbar from "../Components/Navbar";
import { Typography } from "@material-ui/core";
import MUIDataTable from "mui-datatables";
import Loader from "./Loaders";
import {
  createMuiTheme,
  MuiThemeProvider,
  withStyles
} from "@material-ui/core/styles";
 
const columns = [
  {
    name: "pharmacyName",
    label: "Pharmacy Name",
    options: {
      filter: true,
      sort: true
    }
  },
  {
    name: "URL",
    label: "URL",
    options: {
      filter: true,
      sort: true
    }
  },
  {
    name: "streetAddress",
    label: "Street Address",
    options: {
      filter: true,
      sort: true
    }
  },
  {
    name: "city",
    label: "City",
    options: {
      filter: true,
      sort: true
    }
  },
  {
    name: "state",
    label: "State",
    options: {
      filter: true,
      sort: true
    }
  },

  {
    name: "zip",
    label: "Zip",
    options: {
      filter: true,
      sort: true
    }
  },
  {
    name: "phone",
    label: "Phone",
    options: {
      filter: true,
      sort: true
    }
  },
  {
    name: "conditions",
    label: "Conditions",
    options: {
      filter: true,
      sort: true
    }
  },
  {
    name: "companyType",
    label: "Company Type",
    options: {
      filter: true,
      sort: true
    }
  }
];

const data = [
  {
    pharmacyName: "Tiobias Harris Pharmacy",
    URL: "tobias-harris.com",
    streetAddress: "223 Main Street",
    zip: "19144",
    city: "Philadelphia",
    state: "PA",
    phone: "215-555-5555",
    conditions: "Tobias Harris Conditions",
    companyType: "Tobia Harris Pharmacy"
  },
  {
    pharmacyName: "Tiobias Harris Pharmacy",
    URL: "tobias-harris.com",
    streetAddress: "323 Main Street",
    zip: "2088",
    city: "Cherry Hill",
    state: "NJ",
    phone: "215-555-3333",
    conditions: " Harris Conditions",
    companyType: "Kobe Harris Pharmacy"
  },
  {
    pharmacyName: "Tony's Pharmacy",
    URL: "tobias-harris.com",
    streetAddress: "523 Main Street",
    zip: "19145",
    city: "Philadelphia",
    state: "PA",
    phone: "215-555-5555",
    conditions: "Tommy Conditions",
    companyType: "Tobia Harris Pharmacy"
  },
  {
    pharmacyName: "Reddick Pharmacy",
    URL: "reddick-pharmacy.com",
    streetAddress: "123 Main Street",
    zip: "19145",
    city: "Philadelphia",
    state: "PA",
    phone: "215-555-5555",
    conditions: "Tobias Harris Conditions",
    companyType: "Tobia Harris Pharmacy"
  },
  {
    pharmacyName: "Simmons Pharmacy",
    URL: "simmons-pharmacy.com",
    streetAddress: "123 Main Street",
    zip: "19145",
    city: "Philadelphia",
    state: "PA",
    phone: "215-555-5555",
    conditions: "Tobias Harris Conditions",
    companyType: "Tobia Harris Pharmacy"
  }
];

const options = {
  selectableRows: false,
  print: false,
  download: false,
  pagination: false,
  checkbox: false,
  responsive: "scroll",
  onRowClick() {
    alert("works");
  }
};

class BasicTier extends Component {
  constructor(props) {
    super(props);
  }

  //Style themes
  getMuiTheme = () =>
    createMuiTheme({
      overrides: {
        MUIDataTable:{
          root:{
           width:'200px',
         
          }
      
        },
     
        MUIDataTableToolbar: {
          root: {
            background: "#2f4c6e",
            color: "white"
          },
          actions: {
            position: "absolute"
          }
        },
        MuiPaper:{
          root:{
            maxWidth:'92vw',
            margin:'0 auto',
            overflow:'hidden',
            overflowY:'hidden',
            marginTop:'50px',
            marginBottom:'50px',
            width:"80vw"
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
        MuiTypography: {
          root: {
            color: "white"
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
        MUIDataTableHeadCell:{
          root:{
              fontSize:'15px',
              fontFamily: 'Pathway Gothic One, sans-serif'
            }
          
        },
        MUIDataTableFilter:{
          root:{
            width:'550px',
            maxWidth:'550px',
            height:'350px',
            overflowX:'scroll'

          }
        },
        MuiInputLabel:{
          root:{
            fontSize:'15px',
            position:'relative',
            left:'30px'
          }
        }
       
      }
    });

  render() {
    const header = {
      display:"flex",
      justifyContent:"center",
      color: "white",
      textAlign: "left",
      fontFamily: 'Pathway Gothic One, sans-serif'
    };

    return (
      <MuiThemeProvider theme={this.getMuiTheme()}>
        <MUIDataTable
          title={
            <Typography style={header} component="h4" variant="h4" gutterBottom>
              Sample: Basic Teir
            </Typography>
          }
          data={data}
          columns={columns}
          options={options}
        />
      </MuiThemeProvider>
    );
  }
}

export default BasicTier;
