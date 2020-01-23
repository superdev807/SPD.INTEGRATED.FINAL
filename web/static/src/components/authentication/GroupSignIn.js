import React from "react";
import PropTypes from "prop-types";
import { createMuiTheme, MuiThemeProvider } from "@material-ui/core/styles";
import {
  Button,
  CssBaseline,
  FormControl,
  Input,
  InputLabel,
  Paper,
  Typography,
  withStyles,
  Icon
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
    alignItems: "center",
    padding: `${theme.spacing.unit * 2}px ${theme.spacing.unit * 3}px ${theme
      .spacing.unit * 3}px`
  },

  form: {
    width: "100%",
    marginTop: theme.spacing.unit
  },
  submit: {
    marginTop: theme.spacing.unit * 3,
    // backgroundColor: "#424242"
  },
  iconStyle: {
    fontSize: "80px",
    color: "#616161"
  },
  linkStyle: {
    color: "#424242",
    textDecoration:'none'
  }
});

function GroupSignIn(props) {
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
          <Typography component="h1" variant="h5">
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
            <FormControl margin="normal" required fullWidth>
              <InputLabel htmlFor="text">Group Name</InputLabel>
              <Input id="groupname" name="groupname" autoFocus />
            </FormControl>

            <FormControl margin="normal" required fullWidth>
              <InputLabel htmlFor="password">Group password</InputLabel>
              <Input
                name="password"
                type="password"
                id="password"
                autoComplete="current-password"
              />
            </FormControl>
            <br />
            <br />
            <Button
              type="submit"
              href="/explorer"
              fullWidth
              variant="outlined"
              className={classes.submit}
            >
              <Link
                className={classes.linkStyle}
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

GroupSignIn.propTypes = {
  classes: PropTypes.object.isRequired
};

export default withStyles(styles)(GroupSignIn);
