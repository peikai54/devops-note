module.exports = {
  title: "Devops个人笔记",
  description: "Just playing around",
  themeConfig: {
    // sidebar: [
    //   {
    //     title: "Docker", // 必要的
    //     path: "/docker/", // 可选的, 标题的跳转链接，应为绝对路径且必须存在
    //     children: ["/test.md"],
    //     // children: [{ title: "fdas", path: "" }],
    //   },
    // ],
    sidebar: {
      "/": ["常用命令总结和记录"],
      "/docker/": ["", "test"],
    },
  },
};
