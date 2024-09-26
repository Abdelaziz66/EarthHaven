import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/constant.dart';
import '../../../../core/style/textStyles.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({
    super.key,required this.postsNumber,
  });
 final int? postsNumber;


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              const _ProfileImage(),
              const SizedBox(
                width: 15,
              ),
              _ProfileDetails(postsNumber:postsNumber),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Name(),
        ],
      ),
    );
  }
}






class _ProfileDetails extends StatelessWidget {
  const _ProfileDetails({required this.postsNumber});
 final int? postsNumber;

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FadeInRight(
            delay: const Duration(milliseconds: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    '${postsNumber ?? '0'}',
                  style: Styles.textStyle18Bold
                ),
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'Posts',
                  style: Styles.textStyle16
                ),
              ],
            ),
          ),
          FadeInRight(
            delay: const Duration(milliseconds: 150),

            child: const Column(
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
          ),
          FadeInRight(
            delay: const Duration(milliseconds: 300),

            child: const Column(
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
            Text(loginEntity!.bio!,
                style: Styles.textStyle16),
          ],
        ),
      ),
    );
  }
}
