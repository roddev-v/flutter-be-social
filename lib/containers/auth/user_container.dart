part of auth_container;

class UserContainer extends StatelessWidget {
  const UserContainer({Key key, @required this.builder}) : super(key: key);

  final ViewModelBuilder<AppUser> builder;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppUser>(
      builder: builder,
      converter: (Store<AppState> store) {
        return store.state.auth.user;
      },
    );
  }
}
