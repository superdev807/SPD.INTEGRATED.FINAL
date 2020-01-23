import React from "react";
import PropTypes from "prop-types";
import {
  Button,
  CssBaseline,
  FormControl,
  Input,
  InputLabel,
  Paper,
  Typography,
  withStyles,
  Icon,

} from "@material-ui/core";
import Navbar from "../Navbar";
import { Link } from "react-router-dom";

const styles = theme => ({
  main: {
    width: "auto",
    display: "block",
    marginLeft: theme.spacing.unit * 3,
    marginRight: theme.spacing.unit * 3,
    [theme.breakpoints.up(400 + theme.spacing.unit * 3 * 2)]: {
      width: 400,
      marginLeft: "auto",
      marginRight: "auto"
    }
  },
  paper: {
    marginTop: theme.spacing.unit * 8,
    display: "flex",
    flexDirection: "column",
    height:"500px",
    alignItems: "center",
    padding: `${theme.spacing.unit * 2}px ${theme.spacing.unit * 3}px ${theme
      .spacing.unit * 3}px`
  },

  form: {
    width: "100%",
    marginTop: theme.spacing.unit
  },
  submit: {
    marginTop: theme.spacing.unit * 9,
     backgroundColor: "#2f4c6e",
     color:"white"
    
  },
  iconStyle: {
    fontSize: "80px",
    color: "#616161"
  },
  linkSignin: {
    color:'white',
    textDecoration:'none',
    
  },
  linkStyle: {
    color:'#616161',
    textDecoration:'none',
    
  },
  signin:{
    fontFamily: 'Pathway Gothic One, sans-serif',
    textDecoration:'none',
    color:'#616161'
  }
});


function SignIn(props) {
  const { classes } = props;
  return (
    <div>
      <Navbar
        loggedIn={false}
        info="Info"
        name="Speciality Pharmacy Database"
      />
      <main className={classes.main}>
        <CssBaseline />
        <Paper className={classes.paper}>
          <Icon className={classes.iconStyle}>person_pin</Icon>
          <Typography  className={classes.signin} component="h1" variant="h5">
            SIGN IN
          </Typography>

          <form className={classes.form}>
            <FormControl margin="normal" required fullWidth>
              <InputLabel htmlFor="email">Email</InputLabel>
              <Input
                id="email"
                name="email"
                autoComplete="email"
                autoFocus
                className={classes.loggedIn}
              />
            </FormControl>

            <FormControl margin="normal" required fullWidth>
              <InputLabel htmlFor="password">Password</InputLabel>
              <Input
                name="password"
                type="password"
                id="password"
                autoComplete="current-password"
              />
            </FormControl>
            <br />
            <br />
            <Link className={classes.signin} to="/info">Not a member? Join now</Link>
            <br />
            <br />
            <Link className={classes.signin} to="/group">Signing in as a group member for the first time? Login here</Link>
            <Button
              type="submit"
              fullWidth
              variant="outlined"
              className={classes.submit}
              href="/explorer"
            >
              <Link
                className={classes.linkSignin}
                to={{
                  pathname: "/explorer",
                  state: {
                    remainingSubscriptionTime: "21 Days",
                    subscriptionLevel: "Pro"
                  }
                }}
              >
                {" "}
                Sign in
              </Link>
            </Button>
          </form>
        </Paper>
      </main>
    </div>
  );
}

SignIn.propTypes = {
  classes: PropTypes.object.isRequired
};

export default withStyles(styles)(SignIn);
