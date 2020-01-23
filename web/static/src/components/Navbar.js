import React, { Component } from "react";
import PropTypes from "prop-types";
import { withStyles } from "@material-ui/core/styles";
import {
  AppBar,
  Toolbar,
  Typography,
  IconButton,
  Grid,
  Button
} from "@material-ui/core";
import { BrowserRouter as Router, Route, Link } from "react-router-dom";
import Info from "../Pages/Info/";
import Icon from "@material-ui/core/Icon";
import ManageUsers from "../Pages/ManageUsers";
import logo from '../logo2.png'

const styles = {
  root: {
    flexGrow: 1,
    width: "300%"
  },
  grow: {
    flexGrow: 1,
    // position: "fixed",
    fontFamily: 'Pathway Gothic One, sans-serif'
  },
  menuButton: {
    marginLeft: -12,
    marginRight: 20
  },
  icon: {
    fontSize: "200%"
  },
  nav: {
    backgroundColor: "#2f4c6e",
    width: "100%"
  },

  links: {
    color: "white",
    fontSize: "25px",
    position: "relative",
    textDecoration: "none",
    left: "25%",
    margin: "20px",
    top: "0",
    textAlign: "center",
    fontFamily: 'Pathway Gothic One, sans-serif',
  
    
  },
  home: {
    color: "white",
    fontSize: "18px",
    textDecoration: "none",
    margin: "20px",
    fontFamily: 'Pathway Gothic One, sans-serif',
  
    
  },
  dashBoardItems:{
     fontFamily: 'Pathway Gothic One, sans-serif',
     color:'white'
  },

  small: {
    lineHeight: "10%",
    fontSize: "70%"
  },
  navItems: {
    color: "white",
    textDecoration: "none",
    // position: "fixed",
    right: "25%",
    top: "0",
    fontSize: "80%"
  },
  admin: {
    color: "white",
    textDecoration: "none",
    fontSize: "100%",
    margin: "10px"
  }
};

class ButtonAppBar extends Component {
  constructor(props) {
    super(props);

    this.state = {
      loggedIn: false
    };
  }

  render() {
    let { classes } = this.props;
    return (
      <div className={classes.root}>
        <AppBar className={classes.nav} position="static">
          <Toolbar>
            <IconButton
              className={classes.menuButton}
              color="inherit"
              aria-label="Menu"
            />
            <br />
            <br />

            
             <Link className={classes.home} to="/"><span><img style={{height:"30px",width:"30px",margin:"5px"}} src={logo}></img>Speciality Pharmacy</span></Link> 
             

            <Typography variant="h6" color="inherit" className={classes.grow}>
              {this.props.manageUsers}
            </Typography>

            {this.props.loggedIn ? (
              <Grid container>

              
                <Grid item={12}>
                  <Typography
                    variant="h5"
                    color="inherit"
                    className={classes.navItems}
                  >
                   

                    <Grid item={6}>
                   
                      <br />
                      <br />

                      <Button size="small" href="/manageusers" className={classes.links}>
                        Manage Users
                    
                      
                  </Button>
                      <Button size="small" href="/manageusers" className={classes.links}>
                     
                      Subscription Level: {this.props.subscription}
                      
                  </Button>

                      <Button size="small" href="/manageusers" className={classes.links}>
                     
                      Subscription Status:
                        {this.props.remainingSubscriptionTime}
                  
                      
                  </Button>

                  <Button size="small" href="/info" className={classes.links}>
                       {this.props.info}
                  </Button>

                     
                    </Grid>

                    <Grid>
                      <Link className={classes.admin} to="explorer">
                        {this.props.edit}
                      </Link>
                    </Grid>
                  </Typography>
                </Grid>
              </Grid>
            ) : (
              false
            )}

            <br />
                

            <Link className={classes.links} to="/">
              <Icon className={classes.icon}>account_circle</Icon>
              <small className={classes.small}>{this.props.username}</small>
            </Link>

            {/* {this.props.loggedIn? <Link className={classes.links} to="/"><Icon>arrow_drop_down_circle</Icon></Link> : false}          */}
          </Toolbar>
        </AppBar>
      </div>
    );
  }
}

ButtonAppBar.propTypes = {
  classes: PropTypes.object.isRequired
};

export default withStyles(styles)(ButtonAppBar);
