import React, {useEffect,useContext } from "react";
import Navbar from "../../components/Navbar";
import MUIDataTable from "mui-datatables";
import Loader from "../../components/Loaders";
import { createMuiTheme, MuiThemeProvider } from "@material-ui/core/styles";
import { Typography, withStyles, Grid } from "../../../node_modules/@material-ui/core";
import {styles,centerLoader,containerStyle,getMuiTheme} from './styles'
import {data,tableStyle,columns,options} from './tableData'
import {store} from '../../Store'



const Explorer = props => {
    const GlobalContext = useContext(store)
    const {state,dispatch} = GlobalContext
    const { classes } = props;
    console.log(state)
    return (
        state.isLoading ? 
        ( <div style={centerLoader}> <Loader /></div>) : 

        (
          <div>
            <Navbar
              remainingSubscriptionTime={state.remainingSubscriptionTime}
              subscription={state.subscriptionLevel}
              loggedIn={true}
              username='Mitch'
            />
            <br/>
            <br/>
        <MuiThemeProvider theme={getMuiTheme()}>
        <div style={containerStyle}>
          <MUIDataTable
            title={
              <Typography
                className={classes.header}
                component="h4"
                variant="h4"
                gutterBottom
              >
                Pharmacy Database
              </Typography>
            }
            data={data}
            columns={columns}
            options={options}
          />
          </div>
        </MuiThemeProvider>
  
        </div>
      )
    )
     
}

export default withStyles(styles)(Explorer);