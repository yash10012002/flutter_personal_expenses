import 'package:flutter/material.dart';
import 'package:flutter_personal_expenses/models/transaction.dart';
import 'transaction_item.dart';

class TransactonList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;
  TransactonList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, Constraints) {
              return Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'No Transaction added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: Constraints.maxHeight * 0.6,
                      child: Image.asset(
                        'assets/images/Empty.png',
                        fit: BoxFit.cover,
                      )),
                ],
              );
            },
          )
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTx: deleteTx,
                    ))
                .toList(),
          );
  }
}
