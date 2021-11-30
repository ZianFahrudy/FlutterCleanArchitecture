import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/app/widgets/appbar_search/search_bar.dart';
import 'package:flutter_clean_architecture/core/utility/ripple_painter.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';

class AppBarSearchFilter extends StatefulWidget implements PreferredSizeWidget {
  const AppBarSearchFilter({
    Key? key,
    this.searchController,
    required this.title,
    this.onFilterPress,
    this.showFilter = true,
    this.showSearch = true,
    this.showDrawerMenu = false,
    this.onChangeSearchBar,
  }) : super(key: key);

  /// text editing controller for the search field
  /// is optional if the searchbar is shown
  final TextEditingController? searchController;

  /// appbar ttitle, this is required
  final String title;

  /// action callback what would you do on the filter button
  final VoidCallback? onFilterPress;

  /// to show and hide filter button
  final bool showFilter;

  /// to show and hide search button
  final bool showSearch;

  ///with drawer menu
  final bool showDrawerMenu;

  /// onChange search bar text
  final Function(String value)? onChangeSearchBar;

  @override
  _AppBarSearchFilterState createState() => _AppBarSearchFilterState();

  @override
  Size get preferredSize => AppBar().preferredSize;
}

class _AppBarSearchFilterState extends State<AppBarSearchFilter>
    with SingleTickerProviderStateMixin {
  /// Animation ripple
  ///
  double? rippleStartX, rippleStartY;

  /// Animation controller
  ///
  late AnimationController _animationController;

  /// The animation
  ///
  late Animation _animation;

  /// to change search mode
  ///
  bool _isSearchMode = false;

  /// play the animation when [search] icon tapped
  ///
  onSearchTapUp(TapUpDetails details) {
    setState(() {
      rippleStartX = details.globalPosition.dx;
      rippleStartY = details.globalPosition.dy;
    });

    _animationController.forward();
  }

  /// close [searchBar] back to [appBar]
  ///
  cancelSearch() {
    setState(() {
      _isSearchMode = false;
    });

    _animationController.reverse();
  }

  /// Animation listener to open [SearchField]
  ///
  animationStatusListener(AnimationStatus animationStatus) {
    if (animationStatus == AnimationStatus.completed) {
      setState(() {
        _isSearchMode = true;
      });
    }
  }

  void openDrawer(BuildContext context) {
    // context.read<ToggleDrawerCubit>().closeDrawer();
    // context.read<ToggleDrawerCubit>().openDrawer();
  }

  void closeDrawer(BuildContext context) {
    // context.read<ToggleDrawerCubit>().openDrawer();
  }

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    _animationController.addStatusListener(animationStatusListener);
  }

  @override
  Widget build(BuildContext context) {
    final Widget searchBar = SearchBar(
      controller: widget.searchController,
      onLeadingPress: cancelSearch,
      hintText: 'Search',
      hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
          color:
              Get.isDarkMode ? Theme.of(context).hintColor : Colors.grey[300]),
      inputTextStyle: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(color: Theme.of(context).appBarTheme.foregroundColor),
      onChange: widget.onChangeSearchBar,
    );

    final Widget animationBuilder = AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: RipplePainter(
            color: Theme.of(context).appBarTheme.backgroundColor,
            containerHeight: AppBar().preferredSize.height,
            center: Offset(rippleStartX ?? 0, rippleStartY ?? 0),
            radius: _animation.value * Get.width,
            context: context,
          ),
        );
      },
    );

    final Widget searchButton = GestureDetector(
      onTapUp: onSearchTapUp,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          CupertinoIcons.search,
          color: Theme.of(context).appBarTheme.foregroundColor,
        ),
      ),
    );

    final Widget filterButton = IconButton(
        onPressed: widget.onFilterPress,
        icon: Icon(IconlyLight.filter2,
            color: Theme.of(context).appBarTheme.foregroundColor));

    return Stack(
      children: [
        AppBar(
          title: Text(widget.title),
          leading: widget.showDrawerMenu
              ? IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    // if (context.read<ToggleDrawerCubit>().state)
                    //   openDrawer(context);
                    // closeDrawer(context);
                  },
                )
              : null,
          actions: [
            if (widget.showSearch) searchButton,
            if (widget.showFilter) filterButton
          ],
        ),

        /// * Builder animation using ripple
        ///
        animationBuilder,
        if (_isSearchMode)
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: searchBar,
          ),
      ],
    );
  }
}
