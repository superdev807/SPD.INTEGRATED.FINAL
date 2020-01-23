import * as React from "react";
import Paper from "@material-ui/core/Paper";
import { EditingState } from "@devexpress/dx-react-grid";
import NavBar from "../Components/Navbar";
import { createMuiTheme, MuiThemeProvider } from "@material-ui/core/styles";
import {
  Grid,
  Table,
  TableHeaderRow,
  TableEditRow,
  TableEditColumn
} from "@devexpress/dx-react-grid-material-ui";

//Data
const firstNames = [
  "James",
  "John",
  "Robert",
  "William",
  "David",
  "Richard",
  "Thomas",
  "Paul",
  "Mark"
];
const lastNames = [
  "Smith",
  "Johnson",
  "Williams",
  "Jones",
  "Brown",
  "Davis",
  "Johnson",
  "Miller",
  "Wilson",
  "Moore",
  "Taylor",
  "Anderson"
];
const companyTitles = ["Pharmacy tech", "Pharmacist"];
const groupNames = ["Lucky-Staff", "SP-Staff", "Radnor-Staff"];
const companyNames = [
  "Lucky Pharmacy",
  "South Philadelphia Pharmacy",
  "Radnor Pharmacy"
];
const emails = [
  "miker@gmail.com",
  "reggiemiller@yahoo.com",
  "jjreddick@hotmail.com",
  "miker@gmail.com",
  "reggiemiller@yahoo.com",
  "jjreddick@hotmail.com",
  "ojmayo@gmail.com"
];
const groupPasswords = ["test1234", "password123", "test567"];
const yearsOfExperience = ["20", "12", "3"];

let color = {
  background:'black'
}

function randomSeed(seed = 123456789) {
  let mW = seed;
  let mZ = 987654321;
  const mask = 0xffffffff;

  return () => {
    mZ = (36969 * (mZ & 65535) + (mZ >> 16)) & mask;
    mW = (18000 * (mW & 65535) + (mW >> 16)) & mask;
    let result = ((mZ << 16) + mW) & mask;
    result /= 4294967296;
    return result + 0.5;
  };
}

function generateRows({
  columnValues = defaultColumnValues,
  length,
  random = randomSeed(329972281)
}) {
  const data = [];
  const columns = Object.keys(columnValues);

  for (let i = 0; i < length; i += 1) {
    const record = {};

    columns.forEach(column => {
      let values = columnValues[column];

      if (typeof values === "function") {
        record[column] = values({ random, index: i, record });
        return;
      }

      while (values.length === 2 && typeof values[1] === "object") {
        values = values[1][record[values[0]]];
      }

      const value = values[Math.floor(random() * values.length)];
      if (typeof value === "object") {
        record[column] = Object.assign({}, value);
      } else {
        record[column] = value;
      }
    });

    data.push(record);
  }

  return data;
}
const defaultColumnValues = {
  firstNames,
  lastNames,
  emails,
  groupNames,
  companyNames,
  companyTitles,
  groupPasswords,
  yearsOfExperience
};
const getRowId = row => row.id;

export default class ManageUsers extends React.PureComponent {
  constructor(props) {
    super(props);

    this.state = {
      columns: [
        { name: "id", title: "ID" },
        { name: "firstNames", title: "First Name" },
        { name: "lastNames", title: "Last Name" },
        { name: "emails", title: "Email" },
        { name: "companyNames", title: "Company Name" },
        { name: "companyTitles", title: "Company Title" },
        { name: "yearsOfExperience", title: "Years Of Experience" },
        { name: "groupNames", title: "Group Name" },
        { name: "groupPasswords", title: "Group Password" }
      ],
      tableColumnExtensions: [{ columnName: "id", width: 30 }],
      rows: generateRows({
        columnValues: { id: ({ index }) => index, ...defaultColumnValues },
        length: 8
      }),
      editingRowIds: [],
      addedRows: [],
      rowChanges: {}
    };

    this.changeAddedRows = this.changeAddedRows.bind(this);
    this.changeEditingRowIds = this.changeEditingRowIds.bind(this);
    this.changeRowChanges = this.changeRowChanges.bind(this);
    this.commitChanges = this.commitChanges.bind(this);
  }

  changeAddedRows(addedRows) {
    const initialized = addedRows.map(row =>
      Object.keys(row).length ? row : { city: "Tokio" }
    );
    this.setState({ addedRows: initialized });
  }

  changeEditingRowIds(editingRowIds) {
    this.setState({ editingRowIds });
  }

  changeRowChanges(rowChanges) {
    this.setState({ rowChanges });
  }

  commitChanges({ added, changed, deleted }) {
    let { rows } = this.state;
    if (added) {
      const startingAddedId =
        rows.length > 0 ? rows[rows.length - 1].id + 1 : 0;
      rows = [
        ...rows,
        ...added.map((row, index) => ({
          id: startingAddedId + index,
          ...row
        }))
      ];
    }
    if (changed) {
      rows = rows.map(row =>
        changed[row.id] ? { ...row, ...changed[row.id] } : row
      );
    }
    if (deleted) {
      const deletedSet = new Set(deleted);
      rows = rows.filter(row => !deletedSet.has(row.id));
    }
    this.setState({ rows });
  }



  getMuiTheme = () =>
  createMuiTheme({
    overrides: {
      MuiTableHead:{
      root:{
        
        background: "#2f4c6e",
        color: "white"
        
        }
    
      },
      MuiPaper:{
        root:{
         background:'lightgray'
        }
       
        },
      TableHeaderCell:{
        container:{
          color:'white',
          fontFamily: 'Pathway Gothic One, sans-serif'
        }
      },
      MuiButton:{
        label:{
          color:'gray',
          fontFamily: 'Pathway Gothic One, sans-serif'
        }
      },
      MuiTableCell:{
        root:{
          fontFamily: 'Pathway Gothic One, sans-serif',
          
        }
      },
      TableContainer:{
        root:{
          maxWidth:'95vw',
          margin:'0 auto',
          marginBottom:'50px'
        }
      }
   
    }
  });

  render() {
    const {
      rows,
      columns,
      tableColumnExtensions,
      editingRowIds,
      rowChanges,
      addedRows
    } = this.state;

    let containerStyle = {
      background: 'rgba(189, 189, 189, 0.3)'
    }
    return (
      <div>
        <NavBar
          remainingSubscriptionTime="21 Days"
          subscription="Pro"
          loggedIn={true}
          username="Mitch"
          // edit="Explorer"
        />
        <br/>
        <br/>
        <MuiThemeProvider theme={this.getMuiTheme()}>
        <Paper>
          <Grid rows={rows} columns={columns} getRowId={getRowId}>
            <EditingState
              editingRowIds={editingRowIds}
              onEditingRowIdsChange={this.changeEditingRowIds}
              rowChanges={rowChanges}
              onRowChangesChange={this.changeRowChanges}
              addedRows={addedRows}
              onAddedRowsChange={this.changeAddedRows}
              onCommitChanges={this.commitChanges}
            />
            <Table columnExtensions={tableColumnExtensions} />
            <TableHeaderRow/>
            <TableEditRow />
            <TableEditColumn
              showAddCommand={!addedRows.length}
              showEditCommand
              showDeleteCommand
             
            />
          </Grid>
        </Paper>
        </MuiThemeProvider>
      </div>
    );
  }
}
