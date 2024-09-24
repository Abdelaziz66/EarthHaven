import 'package:flutter/material.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/style/textStyles.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              _ProfileImage(),
              SizedBox(
                width: 15,
              ),
              _ProfileDetails(),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Name(),
        ],
      ),
    );
  }
}






class _ProfileDetails extends StatelessWidget {
  const _ProfileDetails();

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '21',
                style: Styles.textStyle18Bold
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                'Posts',
                style: Styles.textStyle16
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '289',
                style: Styles.textStyle18Bold
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                'Followers',
                style: Styles.textStyle16
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '371',
                style: Styles.textStyle18Bold
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                'Following',
                style: Styles.textStyle16
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage();

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration:
      const BoxDecoration(shape: BoxShape.circle, boxShadow: [
        BoxShadow(
          color: Colors.greenAccent,
          blurRadius: 2,
          spreadRadius: 2,
        ),
      ]),
      child: CircleAvatar(
        radius: 45,
        backgroundImage:
        NetworkImage(loginEntity?.profileImage==
            ''
            ? 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'
            : loginEntity?.profileImage ??
            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',),
      ),
    );
  }
}

class Name extends StatelessWidget {
  const Name({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(loginEntity!.name!,
                style: Styles.textStyle16black),
            const SizedBox(
              height: 2,
            ),
            Text(loginEntity!.email!,
                style: Styles.textStyle16black),
          ],
        ),
      ),
    );
  }
}
