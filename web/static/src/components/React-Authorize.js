import React, { Component } from "react";
import styled from "styled-components";
import classnames from 'classnames';
import { FormComponent, FormContainer } from "react-authorize-net";
import { Flex, Box, Text, Heading } from "rebass";




// const  State = {
//   status: "paid" | "unpaid" | ["failure"
// };

const Button = styled.button({
  "&:hover": { cursor: "pointer" },
  padding: "10px",
  backgroundColor: "white",
  border: "2px solid black",
  fontWeight: 600,
  borderRadius: "2px"
});

const ErrorComponent = (props: {
  errors: string[];
  onBackButtonClick: () => void;
}) => (
   <div>
    <Text fontSize={3} fontWeight={"500"} mb={3}>
      Failed to process payment
    </Text>
    {props.errors.map(error => (
      <Text py={2}>{error}</Text>
    ))}
    <Button onClick={props.onBackButtonClick}>Go Back</Button>
  </div>
);

const Header = props => (
  <Flex py={4}>
 
  </Flex>
);

class ReactAuthorizeForm extends Component<{}, State> {
  state: State = { status: "unpaid" };

  onErrorHandler = (response: any) => {
    this.setState({
      status: ["failure", response.messages.message.map(err => err.text)]
    });
  };

  onSuccessHandler = (response: any) => {
    // Process API response on your backend...
    this.setState({ status: ["failure", []] });
    console.log('Success!!')
  };

  render() {
    //Testing
let clientKey = '8bgSN76A4'
let apiLoginId = '6y28Uk4gPa7TL584'
    return (
      <Box className="App" p={3}>
        <Header />
        {this.state.status === "paid" ? (
          <Text fontWeight={"500"} fontSize={3} mb={4}>
            Thank you for your payment!
          </Text>
        ) : this.state.status === "unpaid" ? (
          <FormContainer 
            environment="sandbox"
            onError={this.onErrorHandler}
            onSuccess={this.onSuccessHandler}
            amount={70}
            component={<FormComponent style={{background:'white'}} />}
            clientKey={clientKey}
            apiLoginId={apiLoginId}
          />
        ) : this.state.status[0] === "failure" ? (
          <ErrorComponent
            onBackButtonClick={() => this.setState({ status: "unpaid" })}
            errors={this.state.status[1]}
          />
        ) : null}
      </Box>
    );
  }
}

export default ReactAuthorizeForm