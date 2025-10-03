List<ZyntraSolutionPart> zyntraSolution = [
  ZyntraSolutionPart(
    title: "Overview of the Proposed Solution",
    description:
        "In this proposed solution, we provide an AI-based interactive dashboard that will turn NASA's 608 bioscience publications into an accessible and intelligent knowledge management system. Created as an interactive web app, the research platform uses strong artificial intelligence, knowledge graphs, and intuitive user interfaces to allow effortless exploration of research findings in the field of space biology",
  ),
  ZyntraSolutionPart(
    title: "Accessibility of Information",
    description:
        "To address the challenge of accessibility, the solution incorporates AI-powered semantic search capabilities that defer from traditional keyword-based search models. Users will be able to ask complex scientific questions in natural language, and the system will intelligently retrieve and respond exclusively from information obtained through NASA's validated bioscience publications, maximizing reliability and ensuring scientific accuracy of responses",
  ),
  ZyntraSolutionPart(
    title: "Integrating Knowledge and Discovery",
    description:
        "The platform addresses the problem of fragmentation in research by implementing automated summarization of content associated with individual publications which make it easy for researchers to find primary findings, methodology, and conclusions, in a timely manner. Furthermore, with advanced algorithms, the system will look for themes across these publications, indicating consensus, disagreements, and gaps in emerging research",
  ),
  ZyntraSolutionPart(
    title: "Supporting Decision Making",
    description:
        "The dashboard will convert descriptive data from complex experiments into usable information that is tailored for the purposes of mission planning and support decision-making with evidence as astronauts explore the moon and Mars.",
  ),
];

class ZyntraSolutionPart {
  final String title;
  final String description;

  ZyntraSolutionPart({required this.title, required this.description});
}
