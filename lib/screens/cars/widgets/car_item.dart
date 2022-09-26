part of '../cars_screen.dart';

class _CarItem extends StatelessWidget {
  const _CarItem({Key? key, required this.name}) : super(key: key);
  final CarModel name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (name.localImage != null)
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: FileImage(name.localImage!))),
          ),
        if (name.url != null && name.url!.isNotEmpty)
          Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(name.url!), fit: BoxFit.cover))),
        const SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${name.years} ',
              textAlign: TextAlign.left,
              style: GoogleFonts.iceland(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Text("${name.volume}"),
        Text(
          '${name.name} ${name.model}',
          style: GoogleFonts.hind(
              fontSize: 16, fontWeight: FontWeight.w200, color: Colors.blue),
        ),
        Text(
          '${name.price}\$',
          style: GoogleFonts.hind(
              fontSize: 16,
              fontWeight: FontWeight.w200,
              color: Colors.deepOrange),
        ),
      ],
    );
  }
}
