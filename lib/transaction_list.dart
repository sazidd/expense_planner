import 'package:flutter/material.dart';
import 'package:flutter_expense_planner/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransactions;
  TransactionList(this.transactions, this.deleteTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  "No Transaction added yet!",
                  style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                    height: 200.0,
                    child: Image.asset("images/waiting.jpg", fit: BoxFit.cover))
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6.0),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red,),
                      onPressed:()=> deleteTransactions(transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
