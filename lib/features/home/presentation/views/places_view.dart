import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_zone/features/home/presentation/manager/branch_cubit/branch_cubit.dart';
import 'package:trust_zone/features/home/presentation/manager/branch_cubit/branch_state.dart';
import 'package:trust_zone/utils/set_up_service_locator.dart';

class PlacesView extends StatelessWidget {
  final int categoryId;
  final String categoryName;

  const PlacesView({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<BranchCubit>()..getBranches(categoryId),
      child: Scaffold(
        appBar: AppBar(title: Text(categoryName)),
        body: BlocBuilder<BranchCubit, BranchState>(
          builder: (context, state) {
            if (state is BranchLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is BranchLoaded) {
              return ListView.builder(
                itemCount: state.branches.length,
                itemBuilder: (_, index) {
                  final branch = state.branches[index];
                  final place = branch.place;

                  return Card(
                    margin: EdgeInsets.all(8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueGrey,
                        child: Icon(Icons.store, color: Colors.white),
                      ),
                      title: Text(place.name),
                      subtitle: Text(branch.address),
                      onTap: () {
                        print('Navigating to branch details with: ${branch.place.name}');
                        context.push('/branch-details',  extra: {'branch': branch},);
                      },
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("4.7"),
                          Icon(Icons.star, color: Colors.amber, size: 20),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is BranchError) {
              return Center(child: Text('Error: ${state.message}'));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
