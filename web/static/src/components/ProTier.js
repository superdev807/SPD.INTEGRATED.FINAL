import React, { Component } from "react";
import { Typography, withStyles, Grid } from "@material-ui/core";
import MUIDataTable from "mui-datatables";
import { createMuiTheme, MuiThemeProvider } from "@material-ui/core/styles";

const styles = theme => ({
  pro: {
    color: "red"
  },
  header: {
    display:"flex",
    justifyContent:"center",
    color: "white",
    fontFamily: 'Pathway Gothic One, sans-serif'
  }
});

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
  },
  {
    name: "pharmacyContact",
    label: "Pharmacy Contact",
    options: {
      filter: true,
      sort: true
    }
  },
  {
    name: "contactEmail",
    label: "Contact Email",
    options: {
      filter: true,
      sort: true
    }
  },

  {
    name: "accreditation",
    label: "Accreditation",
    options: {
      filter: true,
      sort: true
    }
  },

  {
    name: "Owner_Independent",
    label: "Owner/Independent",
    options: {
      filter: true,
      sort: true
    }
  },
  {
    name: "patientServices",
    label: "Patient Services",
    options: {
      filter: true,
      sort: true
    }
  },
  {
    name: "payerServices",
    label: "Payer Services",
    options: {
      filter: true,
      sort: true
    }
  },
  {
    name: "pharmaServices",
    label: "Pharma Services",
    options: {
      filter: true,
      sort: true
    }
  },
  {
    name: "locations",
    label: "Locations",
    options: {
      filter: true,
      sort: true
    }
  },
  {
    name: "limitedDistributionDrugs",
    label: "Limted Distribution Drugs",
    options: {
      filter: true,
      sort: true
    }
  }
];

const data = [
  {
    pharmacyName: "Simmons Pharmacy",
    URL: "Mike Miller",
    streetAddress: "123 Main Street",
    zip: "19145",
    city: "Philadelphia",
    state: "PA",
    phone: "215-555-5555",
    conditions: "NA",
    companyType: "Family Owned",
    pharmacyContact: "Mr Lee",
    contactEmail: "mlee@gmail.com",
    accreditation: "True",
    Owner_Independent: "Independent",
    patientServices: "NA",
    payerServices: "NA",
    pharmaServices: "NA",
    locations: "1233 Main Street",
    limitedDistributionDrugs: "NA"
  },

  {
    pharmacyName: "Reddick Pharmacy",
    URL: "Mary Venus",
    streetAddress: "1555 S Synder Ave",
    zip: "19143",
    city: "Philadelphia",
    state: "PA",
    phone: "215-555-5555",
    conditions: "NA",
    companyType: "Family Owned",
    pharmacyContact: "Mr Lee",
    contactEmail: "mlee@gmail.com",
    accreditation: "True",
    Owner_Independent: "Independent",
    patientServices: "NA",
    payerServices: "NA",
    pharmaServices: "NA",
    locations: "1233 Main Street",
    limitedDistributionDrugs: "NA"
  },

  {
    pharmacyName: "Embbid Pharmacy",
    URL: "Kendrick Cole",
    streetAddress: "3000 N Market Street",
    zip: "19128",
    city: "Cherry Hill",
    state: "NJ",
    phone: "215-555-5555",
    conditions: "NA",
    companyType: "Family Owned",
    pharmacyContact: "Mr Lee",
    contactEmail: "mlee@gmail.com",
    accreditation: "True",
    Owner_Independent: "Independent",
    patientServices: "NA",
    payerServices: "NA",
    pharmaServices: "NA",
    locations: "1233 Main Street",
    limitedDistributionDrugs: "NA"
  },

  {
    pharmacyName: "The Process Pharmacy",
    URL: "Darius Mark",
    streetAddress: "988 S Day Street",
    zip: "19092",
    city: "Philadelphia",
    state: "PA",
    phone: "215-555-5555",
    conditions: "NA",
    companyType: "Family Owned",
    pharmacyContact: "Mr Lee",
    contactEmail: "mlee@gmail.com",
    accreditation: "True",
    Owner_Independent: "Independent",
    patientServices: "NA",
    payerServices: "NA",
    pharmaServices: "NA",
    locations: "1233 Main Street",
    limitedDistributionDrugs: "NA"
  },

  {
    pharmacyName: "Boden Pharmacy",
    URL: "Durrant Curry",
    streetAddress: "3111 Warrior Pk",
    zip: "19127",
    city: "Philadelphia",
    state: "PA",
    phone: "215-555-5555",
    conditions: "NA",
    companyType: "Family Owned",
    pharmacyContact: "Mr Lee",
    contactEmail: "mlee@gmail.com",
    accreditation: "True",
    Owner_Independent: "Independent",
    patientServices: "NA",
    payerServices: "NA",
    pharmaServices: "NA",
    locations: "1233 Main Street",
    limitedDistributionDrugs: "NA"
  }
];

const options = {
  selectableRows: false,
  print: false,
  pagination: false,
  // fixedHeader: true,
  download: false,
  checkbox: false,
  reponsive: "stacked",
  onRowClick() {
    alert("works");
  }
};

const tableContainer = {
  width: "3000px",
  margin: "0 auto"
};

class ProTier extends Component {
  constructor(props) {
    super(props);
  }
  //Style themes
  getMuiTheme = () =>
    createMuiTheme({
      overrides: {
        MUIDataTable:{
          root:{
           width:'650px',
         
          }
      
        },
     
        MuiPaper:{
          root:{
            maxWidth:'82vw',
            margin:'0 auto',
            overflowX:'scroll',
            marginBottom:'50px',
            position:'relative',
            marginTop:'2px'
         
          },
          
          elevation2:{
            '27':{
              boxShadow:'none',
              // overflowX:'hidden',
            
            }
          }
        },
        
        MUIDataTableToolbar: {
          root: {
            background:" #2f4c6e",
            color: "white",
           width:'2200px',
          position:'relative'
            
  
         },
         
       
          actions: {
            position: "absolute"
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
            width: "5px",
            maxWidth: "200px",
            fontFamily: 'Pathway Gothic One, sans-serif',
            fontSize:'90%'
          }
        },
        MuiInputBase:{
          root:{
            color:'lightgray',
            fontSize:'18px',
            textAlign:'right',
            position:'absolute',
            left:'8%',
            fontFamily: 'Pathway Gothic One, sans-serif',
             width:'10px'
          }
        },
        MUIDataTableHeadCell:{
          root:{
              fontSize:'15px',
              fontFamily: 'Pathway Gothic One, sans-serif',
              
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
            left:'20px'
          }
        },
        MuiTypography:{
          root:{
             width:'1000px',
         
          }
        },
        MUIDataTableViewCol:{
          root:{
            width:'180px',
            height:'270px'
          }
        }
        
       
      }
    });

  render() {
    let { classes } = this.props;
    return (
      <MuiThemeProvider theme={this.getMuiTheme()}>
        <MUIDataTable
          title={
            <Typography
              className={classes.header}
              component="h4"
              variant="h4"
              gutterBottom
            >
              Sample: Pro Tier
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

export default withStyles(styles)(ProTier);