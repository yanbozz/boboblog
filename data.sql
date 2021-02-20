-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: localhost    Database: mydatabase
-- ------------------------------------------------------
-- Server version	8.0.22

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'Read Only Users');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add post',1,'add_post'),(2,'Can change post',1,'change_post'),(3,'Can delete post',1,'delete_post'),(4,'Can view post',1,'view_post'),(5,'Can add log entry',2,'add_logentry'),(6,'Can change log entry',2,'change_logentry'),(7,'Can delete log entry',2,'delete_logentry'),(8,'Can view log entry',2,'view_logentry'),(9,'Can add permission',3,'add_permission'),(10,'Can change permission',3,'change_permission'),(11,'Can delete permission',3,'delete_permission'),(12,'Can view permission',3,'view_permission'),(13,'Can add group',4,'add_group'),(14,'Can change group',4,'change_group'),(15,'Can delete group',4,'delete_group'),(16,'Can view group',4,'view_group'),(17,'Can add user',5,'add_user'),(18,'Can change user',5,'change_user'),(19,'Can delete user',5,'delete_user'),(20,'Can view user',5,'view_user'),(21,'Can add content type',6,'add_contenttype'),(22,'Can change content type',6,'change_contenttype'),(23,'Can delete content type',6,'delete_contenttype'),(24,'Can view content type',6,'view_contenttype'),(25,'Can add session',7,'add_session'),(26,'Can change session',7,'change_session'),(27,'Can delete session',7,'delete_session'),(28,'Can view session',7,'view_session'),(29,'Can add profile',8,'add_profile'),(30,'Can change profile',8,'change_profile'),(31,'Can delete profile',8,'delete_profile'),(32,'Can view profile',8,'view_profile'),(33,'Can add comment',9,'add_comment'),(34,'Can change comment',9,'change_comment'),(35,'Can delete comment',9,'delete_comment'),(36,'Can view comment',9,'view_comment'),(37,'Can add view count',10,'add_viewcount'),(38,'Can change view count',10,'change_viewcount'),(39,'Can delete view count',10,'delete_viewcount'),(40,'Can view view count',10,'view_viewcount'),(41,'Can add view count',11,'add_viewcount'),(42,'Can change view count',11,'change_viewcount'),(43,'Can delete view count',11,'delete_viewcount'),(44,'Can view view count',11,'view_viewcount'),(45,'Can add view detail',12,'add_viewdetail'),(46,'Can change view detail',12,'change_viewdetail'),(47,'Can delete view detail',12,'delete_viewdetail'),(48,'Can view view detail',12,'view_viewdetail'),(49,'Can add post tag',13,'add_posttag'),(50,'Can change post tag',13,'change_posttag'),(51,'Can delete post tag',13,'delete_posttag'),(52,'Can view post tag',13,'view_posttag');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$150000$jlNC9mgqfW6P$L1j8IusD3IDpV7vF5jYEQy69VyQEpJlP/Ciwrfy8zOw=','2021-02-19 02:33:01.505000',1,'zhaoyanbo','','','yzhao17@luc.edu',1,1,'2020-12-08 03:08:41.208000'),(17,'pbkdf2_sha256$150000$r6Nikydaxh8b$m+YX9vuUkT0vJwoyMkhCfNhMY6GDYoIpBgQXnsupbuI=','2020-12-12 10:51:19.178000',0,'testuser12','','','testuser12@company.com',0,1,'2020-12-12 10:51:09.772000'),(18,'pbkdf2_sha256$150000$QKQ0Ijlod4Wl$AxEvFMI0Qljm4VLEq+V9cshmOkPkc0o20T6gw66j/q4=',NULL,0,'testuser13','','','testuser13@company.com',0,1,'2020-12-12 11:36:39.293000'),(19,'pbkdf2_sha256$150000$YUXdPwKid5N6$i40hYM8xKBCy5z/fwbWly3qx6GJkKOLJrxDl8SbYNQw=','2020-12-13 05:12:39.708000',0,'testuser4','','','testuser4@company.com',0,1,'2020-12-12 13:58:11.647000'),(20,'pbkdf2_sha256$150000$MaOBWv7kQnLA$ZNmC9ZnqzkwrPP3vuIL6tUYwDOIngCmQbyVHiIyBxpc=','2021-01-28 08:08:35.432000',0,'testuser10','','','testuser10@company.com',0,1,'2020-12-30 06:12:09.481000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_post`
--

DROP TABLE IF EXISTS `blog_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `blog_post_author_id_dd7a8485_fk_auth_user_id` (`author_id`),
  CONSTRAINT `blog_post_author_id_dd7a8485_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_post`
--

LOCK TABLES `blog_post` WRITE;
/*!40000 ALTER TABLE `blog_post` DISABLE KEYS */;
INSERT INTO `blog_post` VALUES (25,'Varchar与Char','2021-01-04 08:25:00.612000','Varchar类型可用存储可变长字符串, 比定长类型更节省空间. 它需要用1或者2个字节记录长度. \r\n\r\nChar类型是定长的, 适合存储很短的字符串, 例如密码的MD5值.',1),(63,'codesnippet测试2','2021-01-21 03:27:15.066000','<pre>\r\n<code class=\"language-python\">def printer(a):\r\n    print(a)</code></pre>\r\n\r\n<p>&nbsp;</p>',1),(64,'每日总结012121: ckeditor plugins','2021-01-21 04:01:59.938000','<p>在ckeditor中加入plugins, 例如codesnippet:</p>\r\n\r\n<p><strong>Step1 下载plugin文件:</strong></p>\r\n\r\n<p>将plugin的文件下载到STATICFILES_DIRS中, 然后在terminal中运行:</p>\r\n\r\n<pre>\r\n<code class=\"language-bash\">python manage.py collectstatic</code></pre>\r\n\r\n<p><span style=\"color:#e74c3c\">(注意: 这里不能直接下载到STATIC_ROOT中, django只识别collectstatic命令收集的文件)</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Step2:&nbsp;在settings.py中配置</strong></p>\r\n\r\n<p>在 CKEDITOR_CONFIGS 的最后将plugin的文件名称加入到extraPlugins的key中, 以&nbsp;codesnippet 为例:</p>\r\n\r\n<pre>\r\n<code class=\"language-python\">CKEDITOR_CONFIGS = {\r\n   \'default\': {\r\n      #你的其他配置\r\n      \'extraPlugins\': \',\'.join([\r\n                #其他plugins\r\n                \'codesnippet\',])\r\n  }\r\n</code></pre>\r\n\r\n<p>然后在 &#39;toolbar_YourCustomToolbarConfig&#39; 加入新的字典:</p>\r\n\r\n<pre>\r\n<code>CKEDITOR_CONFIGS = {\r\n    \'default\': {\r\n        #其他配置\r\n        \'toolbar_YourCustomToolbarConfig\': [\r\n            #其他工具的字典\r\n            {\r\n                \'name\': \'extra\',\r\n                \'items\': [\r\n                    \'CodeSnippet\', ],\r\n            },\r\n        ],\r\n        #其他配置\r\n        \'extraPlugins\': \',\'.join([\r\n            #其他plugins\r\n            \'codesnippet\',\r\n        ]),\r\n    }\r\n}</code></pre>\r\n\r\n<p>&nbsp;</p>',1),(65,'每日总结012520: B+树I','2021-01-25 09:00:32.521000','<p>B+树一种常用的数据索引结构, 是一种平衡树(balanced tree). 即每个根结点到每个叶子节点(leaf node)的长度相等. 每个节点除根结点外最多存储n - 1个搜索码和n个对应的指针. 节点分为<strong>叶子节点(</strong>leaf node)和<strong>非叶子节点</strong>(non leaf node).&nbsp;</p>\r\n\r\n<ul>\r\n	<li><strong>叶子节点:</strong> 存储搜索码值. 指针指向搜索码值对应的记录. 同时两端包含两个指针指向相邻的叶子节点. 每个叶子节点最少包含(n - 1) / 2个搜索码</li>\r\n	<li><strong>非叶子节点:</strong> 存储搜索码值. 指针指向搜索码值小于当前搜索码值的子节点. 例如, 当前节点包含 i = 1, 2, 3 .. m - 1(m &lt;= n)个搜索码. 其第i个搜索码K<sub>i</sub>左边的指针P<sub>i</sub>指向的子节点所包含的值全都小于K<sub>i</sub>且大于等于K<sub>i-1.&nbsp;</sub>每个非叶子节点少包含 n / 2个指针.</li>\r\n	<li><strong>根结点:</strong> 类似于非叶子节点, 但是可包含小于n/2个搜索码</li>\r\n</ul>\r\n\r\n<p><strong>B+树的查询</strong></p>\r\n\r\n<p>&nbsp; &nbsp; 从根节点开始, 根据搜索码向下查询直到叶子节点. 例如,&nbsp; 我们要寻找一个V的搜索码. 从当前的节点开始找第一个K<sub>i</sub>大于等于V的码, 查找结果可能为以下三种情况:</p>\r\n\r\n<ol>\r\n	<li>找到Ki &gt; V --&gt; 使用Pi指针继续查询针指向相应子节点</li>\r\n	<li>找到Ki = V --&gt;&nbsp;使用Pi + 1指针继续查询针指向相应子节点</li>\r\n	<li>所有Ki均小于V --&gt; 使用最后一个非空指针, 即Pm继续查询针指向相应子节点</li>\r\n</ol>\r\n\r\n<p>&nbsp; &nbsp; 在相应的子节点也重复以上逻辑. 直到找到查询值.&nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp; 另外, 如果遇到重复的搜索码, 有可能最终找到的叶子节点包含的搜索码全部小于V. 这时, 我们需要继续遍历它的右兄弟, 直到找到V值或者返回空值.</p>\r\n\r\n<p>&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p>&nbsp;</p>',1),(66,'每日总结012620: B+树 II','2021-01-26 10:41:55.917000','<p>上期我们说了B+树的基本概念和查询, 这期我们继续来讲它的其他操作和性质.&nbsp;</p>\r\n\r\n<p><strong>B+树的更新</strong></p>\r\n\r\n<p>B+树的更新可拆分为原数据的<strong>删除</strong>和新数据的<strong>插入</strong></p>\r\n\r\n<p><strong>插入: </strong></p>\r\n\r\n<p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>根据查询算法, 找到插入新的搜索码值的叶子节点. 如果叶子节点空间足够, 直接插入相应的位置. 如果叶子节点空间已满, 则需要分裂当前叶子节点: 即将当前的n个值分为两组, n/2放到原来的节点, 剩下的放入新的节点中. 我们需要将接着新的节点的搜索码值插入到父节点中. 如果父节点也没有足够的空间, 则需要对父节点继续进行分裂.</p>\r\n\r\n<p><strong>删除:&nbsp;</strong></p>\r\n\r\n<ol>\r\n	<li>根据查询算法, 找到需要删除的搜索码值的叶子节点. 删除该搜索码后, 若该节点的搜索码数量大于等(n - 1) / 2, 则删除结束. 否则继续第二步</li>\r\n	<li>若兄弟结点key有富余,即大于（n - 1）/ 2，向兄弟结点借一个记录，同时用借到的key替换父结（指当前结点和兄弟结点共同的父结点）点中的key，删除结束。否则执行第3步。</li>\r\n	<li>若兄弟结点中没有富余的key,则当前结点和兄弟结点合并成一个新的叶子结点，并删除父结点中的key（父结点中的这个key两边的孩子指针就变成了一个指针，正好指向这个新的叶子结点），将当前结点指向父结点（必为索引结点），执行第4步（第4步以后的操作和B树就完全一样了，主要是为了更新索引结点）。</li>\r\n	<li>若索引结点的key的个数大于等于（n - 1）/ 2，则删除操作结束。否则执行第5步</li>\r\n	<li>若兄弟结点有富余，父结点key下移，兄弟结点key上移，删除结束。否则执行第6步</li>\r\n	<li>当前结点和兄弟结点及父结点下移key合并成一个新的结点。将当前结点指向父结点，重复第4步。</li>\r\n</ol>\r\n\r\n<p>B+树更新操作的复杂度为:&nbsp;&nbsp;<span style=\"color:#e74c3c\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></p>\r\n\r\n<p style=\"text-align:center\"><strong><span style=\"color:#e74c3c\">log<sub>[n/2]&nbsp;</sub>(N)</span></strong></p>\r\n\r\n<p>其中n为节点中指针的个数, N为索引文件中记录的个数.</p>',1),(67,'每日总结012820: ajax异步表单提交','2021-01-27 12:53:28.000000','<p>先理解区分一下<strong>同步请求</strong>和<strong>异步请求</strong>的概念:&nbsp;</p>\r\n\r\n<p><strong>同步请求:&nbsp;</strong>当浏览器向服务器发送同步请求时，服务处理同步请求的过程中，浏览器会处于等待的状态，服务器处理完请求<strong>把数据响应给浏览器并覆盖浏览器内存中原有的数据</strong>，浏览器&mdash;&mdash;<strong>重新加载页面并展示服务器响应的数据</strong>。</p>\r\n\r\n<p>拿这次的博客评论表单提交举例. 评论表单提交之后, 向服务器发送POST请求,&nbsp; 将表单数据提交给服务器后, 服务器返回响应数据给浏览器. 因为是同步请求, 返回的响应数据会覆盖浏览现有的数据 -- 整个博客页面都会重新加载. 在django的视图中会<span style=\"background-color:#bdc3c7\">redirect</span>到请求成功的页面, 即<span style=\"background-color:#bdc3c7\">success_url</span>. 用户在重新加载页面之后才能看到自己刚提交的评论. 这样的页面加载对于不必要的.&nbsp;</p>\r\n\r\n<p><strong>异步请求:&nbsp;</strong>浏览器把请求交给<strong>代理对象</strong>&mdash;XMLHttpRequest（绝大多数浏览器都内置了这个对象），<strong>由代理对象向服务器发起请求，接收、解析服务器响应的数据</strong>，并把数据更新到浏览器指定的控件上。从而实现了页面数据的局部刷新。同样的例子, 评论表单提交之后页面不会重新加载, 用户继续停留在提交之前浏览的位置继续浏览, 但是新提交的评论会在指定位置出现.&nbsp;</p>\r\n\r\n<p>运用django和ajax提交异步请求, 可简单分为三个步骤</p>\r\n\r\n<ol>\r\n	<li>ajax在前端页面对请求数据的代理提交</li>\r\n	<li>后端即服务器端, django视图对请求的处理</li>\r\n	<li>服务器返回响应后前端页面的更新</li>\r\n</ol>\r\n\r\n<p><strong><span style=\"font-size:18px\">1. 提交阶段:&nbsp;</span></strong></p>\r\n\r\n<p>在comment_form.html中插入负责提交异步请求的ajax代码</p>\r\n\r\n<pre>\r\n<code class=\"language-html\">&lt;div id=\"reply-form\" class=\"comment-form\" style=\"display: none;\"&gt;\r\n  &lt;form method=\"POST\" action=\"{% url \'comment-post\' object.id %}\"&gt;\r\n      {% csrf_token %}\r\n      &lt;div class=\"form-group\"&gt;\r\n        {{ comment_form|crispy }}\r\n      &lt;/div&gt;\r\n      &lt;div class=\"form-group\"&gt;\r\n        &lt;button class=\"btn btn-primary btn-sm\" type=\"submit\"&gt;发布&lt;/button&gt;\r\n      &lt;/div&gt;\r\n  &lt;/form&gt;\r\n&lt;/div&gt;\r\n\r\n&lt;script type=\"text/javascript\"&gt;\r\n    $(\"#reply-form\").submit(function () {\r\n      const csrftoken = document.querySelector(\'[name=csrfmiddlewaretoken]\').value;\r\n      $.ajax({\r\n        url: \"{% url \'comment-post\' object.id %}\",\r\n        type: \'POST\',\r\n        cache: false,\r\n        data: {\r\n          content: $(\'#reply-form #id_content\').val(),\r\n          content_type: $(\'#reply-form #id_content_type\').val(),\r\n          object_id: $(\'#reply-form #id_object_id\').val(),\r\n          parent: $(\'#reply-form #id_parent\').val(),\r\n          root: $(\'#reply-form #id_root\').val(),\r\n          csrfmiddlewaretoken: csrftoken,\r\n        },\r\n        success: function (data) {\r\n            var rootID = $(\'#reply-form #id_root\').val().toString();\r\n            var replyCount = $(\'#div-comment-\' + rootID + \' .comment-info\' + \' #reply-count\');\r\n            $(\'#reply-box-\' + rootID).prepend(data);\r\n            $(\'#reply-box-\' + rootID).show();\r\n            $(\'#reply-form\').val(\"\");\r\n            $(\'#reply-form\').hide();\r\n            replyCount.text((Number(replyCount.text()) + 1).toString());\r\n          },\r\n        error: function (xhr){\r\n          console.log(xhr);\r\n        }\r\n\r\n      });\r\n      return false;\r\n    });\r\n&lt;/script&gt;\r\n</code></pre>\r\n\r\n<p>url: 为服务器处理表单请求的地址, 可以与同步请求的url相同, 后端代码用条件区分即可.&nbsp;</p>\r\n\r\n<p>data: 支持的数据类型有, PlainObject, string, array. 这里我们采用PlainObject. Ajax会将其转化成string发送. 如果<span style=\"background-color:#bdc3c7\">key</span>和<span style=\"background-color:#bdc3c7\">CommenForm</span>中的字段名称对应, 后端会直接根据其值生成form, 这样就省去了后端赋值的重复操作.&nbsp;</p>\r\n\r\n<p>csrfmiddlewaretoken: 如果原来的表单中加入了crsf_token, 在这里也需要用querySelector将token提取出来插入data中.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><span style=\"font-size:18px\">2. 服务器处理请求阶段:&nbsp;</span></strong></p>\r\n\r\n<p>在原有的处理评论的视图中(这里为<span style=\"background-color:#bdc3c7\">CommentPostView</span>), 重写<span style=\"background-color:#bdc3c7\">post</span>函数:</p>\r\n\r\n<pre>\r\n<code class=\"language-python\">class CommentPostView(CreateView):\r\n    template_name = \"comments/comment_list.html\"\r\n    form_class = CommentForm\r\n    model = Comment\r\n\r\n    def post(self, request, *args, **kwargs):\r\n        # redirect to login page if user not authenticated\r\n        if not request.user.is_authenticated:\r\n            messages.info(self.request, f\"请先登录你的账号.\")\r\n            return redirect(\'/login/?next=%s\' % self.request.path)\r\n        # address ajax request\r\n        if request.is_ajax():\r\n            return self.render_ajax_request(request, *args, **kwargs)\r\n        return super().post(request, *args, **kwargs)\r\n\r\n    # render ajax request\r\n    def render_ajax_request(self, request, *args, **kwargs):\r\n        form = self.get_form()\r\n        form.save(False)\r\n        form.instance.user = request.user\r\n        context = {}\r\n        if form.cleaned_data[\'parent\']:\r\n            form.save(True)\r\n            context[\'child_comment\'] = form.instance\r\n            return render(request, \'comments/reply_list_template.html\', context)\r\n        form.save(True)\r\n        context[\'comment\'] = form.instance\r\n        return render(request, \'comments/comment_list_template.html\', context)\r\n</code></pre>\r\n\r\n<p>在这里加入一个判断条件, is_ajax(). 若是请求类型是XMLHTTPRequest, 交给自己编写的<span style=\"background-color:#bdc3c7\">render_ajax_request</span>处理. 在这个方法中, 我们判断该评论是否是子评论(回复). 因为在模版我们对评论和子评论设置了不同的变量名, <span style=\"background-color:#bdc3c7\">comment</span>和<span style=\"background-color:#bdc3c7\">child_comment</span></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong><span style=\"font-size:18px\">3. 响应返回给前端阶段:&nbsp;</span></strong></p>\r\n\r\n<p><span style=\"background-color:#bdc3c7\">success: function(data)</span>: 这里的data要和上面的data区分开, 它是我们服务器<span style=\"background-color:#bdc3c7\">CommentPostView</span>里渲染好的模版, 数据类型是html. 当然, ajax也允许我们通过datatype设置想要返回的的函数类型, 包括html/text, json, jsonp, 默认的是text/html.</p>\r\n\r\n<p>得到响应数据后我们用<span style=\"background-color:#bdc3c7\">prepand()</span>函数将其插入到想要的位置. 根据是评论还是子评论(回复)插入相应的位置.&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>参考资料:</strong></p>\r\n\r\n<p><a href=\"https://www.bilibili.com/video/BV1sW411K7D4\">​&nbsp;</a><a href=\"https://api.jquery.com/jquery.ajax/\">https://api.jquery.com/jquery.ajax/</a></p>\r\n\r\n<p><a href=\"https://www.youtube.com/watch?v=A291yJ92154&amp;t=265s\">https://www.youtube.com/watch?v=A291yJ92154&amp;t=265s</a></p>\r\n\r\n<p><a href=\"https://www.bilibili.com/video/BV1sW411K7D4\">https://www.bilibili.com/video/BV1sW411K7D4</a></p>\r\n\r\n<p>&nbsp;</p>',20),(68,'boboblog部署I: sqlite到mysql','2021-02-19 04:15:53.478470','<p><strong>1. 配置mysql</strong></p>\r\n\r\n<p>-在.bash_profile中插入</p>\r\n\r\n<pre>\r\n<code class=\"language-bash\">export PATH=${PATH}:/usr/local/mysql/bin/</code></pre>\r\n\r\n<p><strong>重启termanal!!</strong></p>\r\n\r\n<p>-在terminal中输入</p>\r\n\r\n<pre>\r\n<code>mysql -u root -p</code></pre>\r\n\r\n<p>-创建新的schema &ndash; mydatabase</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<pre>\r\n<code class=\"language-bash\">mysql&gt; create database mydatabase default charset=utf8mb4 default collate utf8mb4_unicode_ci;\r\n</code></pre>\r\n\r\n<p>-创建新的user来代替root管理mydatabase</p>\r\n\r\n<pre>\r\n<code>mysql&gt; create user \'username\'@\'localhost\' identified by \'password\';\r\n</code></pre>\r\n\r\n<pre>\r\n-新用户授权\r\n</pre>\r\n\r\n<pre>\r\n<code>mysql&gt; grant all privileges on mydatabase.* to \'username\'@\'localhost\';\r\n</code></pre>\r\n\r\n<p>此时已经可以用新用户进行登录, 且新用户只能看见mydatabase这一个schema</p>\r\n\r\n<p><strong>2. 配置settings.py中database的设置</strong></p>\r\n\r\n<p>-注释化原有的DATABASES变量(以后要用), 插入新的变量如下</p>\r\n\r\n<pre>\r\n<code class=\"language-python\">DATABASES = {\r\n    \'default\': {\r\n        \'ENGINE\': \'django.db.backends.mysql\',\r\n        \'NAME\': \'mydatabase\',\r\n        \'USER\': \'username\',\r\n        \'PASSWORD\': \'password\',\r\n        \'HOST\': \'localhost\',\r\n        \'PORT\': \'3306\',\r\n    }\r\n}\r\n</code></pre>\r\n\r\n<p><strong>3. 安装mysqlclient</strong></p>\r\n\r\n<pre>\r\n<code>pip install mysqlclient</code></pre>\r\n\r\n<p>此时运行</p>\r\n\r\n<pre>\r\n<code>python manage.py runserver</code></pre>\r\n\r\n<p>会出现error</p>\r\n\r\n<pre>\r\n<code>...\r\nNameError: name \'_mysql\' is not defined\r\n</code></pre>\r\n\r\n<p>解决方法: 在.bash_profile中插入</p>\r\n\r\n<pre>\r\n<code>export DYLD_LIBRARY_PATH=\"/usr/local/mysql/lib:$PATH\"</code></pre>\r\n\r\n<p><strong>重启terminal!!</strong></p>\r\n\r\n<p><strong>4. 数据迁移</strong></p>\r\n\r\n<pre>\r\n<code>python manage.py migrate\r\n</code></pre>\r\n\r\n<p>-在settings.py中, 将DATABASES改回sqlite<br />\r\n-利用json文件迁移, sqlite -&gt; json -&gt; mysql</p>\r\n\r\n<p>sqlite -&gt; json</p>\r\n\r\n<pre>\r\n<code>python manage.py dumpdata &gt; data.json</code></pre>\r\n\r\n<p>json -&gt; mysql<br />\r\n在settings.py中将DATABASES改到mysql</p>\r\n\r\n<pre>\r\n<code>python manage.py loaddata data.json </code></pre>\r\n\r\n<p>此时出现error:</p>\r\n\r\n<pre>\r\n<code>django.db.utils.IntegrityError: Problem installing fixture \'/Users/zhaoyanbo/Desktop/boboblog/data.json\': Could not load contenttypes.ContentType(pk=2): (1062, \"Duplicate entry \'admin-logentry\' for key \'django_content_type.django_content_type_app_label_model_76bd3d3b_uniq\'\")\r\n</code></pre>\r\n\r\n<p>这里是因为content_type中有冲突的主键值, 解决方法是在mysql中删除content_type table和其关联的表格</p>\r\n\r\n<pre>\r\n<code>mysql&gt; delete from auth_permission;</code></pre>\r\n\r\n<p>这里auth_permission是与content_type关联的表格</p>\r\n\r\n<pre>\r\n<code>mysql&gt;  delete from django_content_type</code></pre>\r\n\r\n<p>重新加载数据到mysql</p>\r\n\r\n<pre>\r\n<code>python manage.py loaddata data.json </code></pre>\r\n\r\n<p><strong>4. mysql配置时区</strong></p>\r\n\r\n<p>参考以下链接<br />\r\n<a href=\"https://larryullman.com/forums/index.php?/topic/2629-ch-6-pg-190-step-by-step-instructions-for-how-to-load-time-zone-table-info/\">https://larryullman.com/forums/index.php?/topic/2629-ch-6-pg-190-step-by-step-instructions-for-how-to-load-time-zone-table-info/</a></p>',1);
/*!40000 ALTER TABLE `blog_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments_comment`
--

DROP TABLE IF EXISTS `comments_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments_comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `object_id` int unsigned NOT NULL,
  `created` datetime(6) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `user_id` int NOT NULL,
  `parent_id` int DEFAULT NULL,
  `root_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_comment_content_type_id_72fd5dbe_fk_django_co` (`content_type_id`),
  KEY `comments_comment_user_id_a1db4881_fk_auth_user_id` (`user_id`),
  KEY `comments_comment_parent_id_3e0802fb_fk_comments_comment_id` (`parent_id`),
  KEY `comments_comment_root_id_23b4c218_fk_comments_comment_id` (`root_id`),
  CONSTRAINT `comments_comment_content_type_id_72fd5dbe_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `comments_comment_parent_id_3e0802fb_fk_comments_comment_id` FOREIGN KEY (`parent_id`) REFERENCES `comments_comment` (`id`),
  CONSTRAINT `comments_comment_root_id_23b4c218_fk_comments_comment_id` FOREIGN KEY (`root_id`) REFERENCES `comments_comment` (`id`),
  CONSTRAINT `comments_comment_user_id_a1db4881_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=528 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments_comment`
--

LOCK TABLES `comments_comment` WRITE;
/*!40000 ALTER TABLE `comments_comment` DISABLE KEYS */;
INSERT INTO `comments_comment` VALUES (525,65,'2021-02-10 06:40:02.751000','测试评论',1,1,NULL,NULL),(526,65,'2021-02-10 06:40:09.380000','回复 @zhaoyanbo: 测试评论回复',1,1,525,525),(527,66,'2021-02-10 06:40:30.592000','写的还行',1,1,NULL,NULL);
/*!40000 ALTER TABLE `comments_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=678 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-12-08 05:04:48.682000','2','第二个博客',1,'[{\"added\": {}}]',1,1),(2,'2020-12-09 01:57:50.322000','1','Read Only Users',1,'[{\"added\": {}}]',4,1),(3,'2020-12-09 02:00:28.914000','2','testuser1',1,'[{\"added\": {}}]',5,1),(4,'2020-12-09 02:01:17.448000','2','testuser1',2,'[{\"changed\": {\"fields\": [\"first_name\", \"email\", \"groups\"]}}]',5,1),(5,'2020-12-09 04:04:37.783000','2','testuser1',2,'[{\"changed\": {\"fields\": [\"groups\"]}}]',5,1),(6,'2020-12-10 03:26:58.556000','11','第九篇博客',3,'',1,1),(7,'2020-12-10 03:26:58.559000','10','第八篇博客',3,'',1,1),(8,'2020-12-10 03:26:58.561000','9','第七篇博客',3,'',1,1),(9,'2020-12-10 03:26:58.562000','8','第三篇博客',3,'',1,1),(10,'2020-12-10 03:26:58.563000','7','第六篇博客',3,'',1,1),(11,'2020-12-10 03:26:58.565000','6','第三篇博客',3,'',1,1),(12,'2020-12-10 03:26:58.566000','5','第三篇博客',3,'',1,1),(13,'2020-12-10 03:26:58.567000','4','第二篇博客',3,'',1,1),(14,'2020-12-10 03:26:58.569000','3','新的一篇博客',3,'',1,1),(15,'2020-12-10 03:26:58.571000','2','第二个博客',3,'',1,1),(16,'2020-12-10 03:26:58.573000','1','第一个博客.',3,'',1,1),(17,'2020-12-11 02:57:42.960000','11','testuser10',3,'',5,1),(18,'2020-12-11 02:57:42.962000','10','testuser6',3,'',5,1),(19,'2020-12-11 02:57:42.964000','7','testuser7',3,'',5,1),(20,'2020-12-11 02:57:42.965000','8','testuser8',3,'',5,1),(21,'2020-12-11 02:57:42.966000','9','testuser9',3,'',5,1),(22,'2020-12-11 02:58:04.921000','12','testuser6',1,'[{\"added\": {}}]',5,1),(23,'2020-12-12 13:57:45.021000','2','testuser1',3,'',5,1),(24,'2020-12-12 13:57:45.024000','15','testuser10',3,'',5,1),(25,'2020-12-12 13:57:45.026000','3','testuser2',3,'',5,1),(26,'2020-12-12 13:57:45.028000','4','testuser3',3,'',5,1),(27,'2020-12-12 13:57:45.029000','5','testuser4',3,'',5,1),(28,'2020-12-12 13:57:45.031000','6','testuser5',3,'',5,1),(29,'2020-12-12 13:57:45.032000','12','testuser6',3,'',5,1),(30,'2020-12-12 13:57:45.033000','13','testuser7',3,'',5,1),(31,'2020-12-12 13:57:45.034000','14','testuser8',3,'',5,1),(32,'2020-12-12 13:57:45.035000','16','testuser9',3,'',5,1),(33,'2020-12-13 04:58:17.715000','4','testuser4 Profile',2,'[{\"changed\": {\"fields\": [\"profile_pic\"]}}]',8,1),(34,'2020-12-16 07:05:32.516000','1','这是第一条评论',1,'[{\"added\": {}}]',9,1),(35,'2020-12-16 08:28:53.800000','1','这是本站的第一篇评论',1,'[{\"added\": {}}]',9,1),(36,'2020-12-28 11:55:38.779000','2','这是本站的第二篇评论',1,'[{\"added\": {}}]',9,1),(37,'2021-01-14 01:34:35.380000','29','图片',1,'[{\"added\": {}}]',1,1),(38,'2021-01-15 03:35:12.094000','47','图片测试',2,'[{\"changed\": {\"fields\": [\"view_count\"]}}]',1,1),(39,'2021-01-15 07:05:06.151000','1','ViewCount object (1)',1,'[{\"added\": {}}]',10,1),(40,'2021-01-15 07:42:48.804000','2','ViewCount object (2)',3,'',10,1),(41,'2021-01-15 07:43:06.540000','1','ViewCount object (1)',3,'',10,1),(42,'2021-01-15 07:56:46.205000','49','计数测试2',1,'[{\"added\": {}}]',1,1),(43,'2021-01-15 07:57:17.309000','50','计数测试3',1,'[{\"added\": {}}]',1,1),(44,'2021-01-15 07:59:52.078000','51','计数测试4',1,'[{\"added\": {}}]',1,1),(45,'2021-01-15 08:01:53.973000','52','计数测试5',1,'[{\"added\": {}}]',1,1),(46,'2021-01-15 08:17:15.718000','53','计数测试6',1,'[{\"added\": {}}]',1,1),(47,'2021-01-15 08:24:23.352000','54','计数测试7',1,'[{\"added\": {}}]',1,1),(48,'2021-01-15 08:26:43.484000','55','计数测试8',1,'[{\"added\": {}}]',1,1),(49,'2021-01-15 08:30:19.163000','57','计数测试10',1,'[{\"added\": {}}]',1,1),(50,'2021-01-15 08:31:43.852000','56','计数测试9',3,'',1,1),(51,'2021-01-15 08:31:43.856000','55','计数测试8',3,'',1,1),(52,'2021-01-15 08:31:43.857000','54','计数测试7',3,'',1,1),(53,'2021-01-15 08:31:43.859000','52','计数测试5',3,'',1,1),(54,'2021-01-15 08:31:43.860000','51','计数测试4',3,'',1,1),(55,'2021-01-15 08:31:43.861000','50','计数测试3',3,'',1,1),(56,'2021-01-15 08:31:43.863000','49','计数测试2',3,'',1,1),(57,'2021-01-15 08:31:43.864000','48','计数测试',3,'',1,1),(58,'2021-01-15 08:31:43.866000','46','图片测试',3,'',1,1),(59,'2021-01-15 08:31:43.867000','31','代码样例',3,'',1,1),(60,'2021-01-15 08:31:43.869000','30','codesnippet测试',3,'',1,1),(61,'2021-01-15 08:31:43.870000','29','图片',3,'',1,1),(62,'2021-01-15 08:31:43.871000','28','ckeditor测试',3,'',1,1),(63,'2021-01-15 08:31:43.873000','27','CKEDITOR Test',3,'',1,1),(64,'2021-01-15 08:31:43.874000','26','测试汉化',3,'',1,1),(65,'2021-01-15 08:31:43.876000','24','第九篇博客',3,'',1,1),(66,'2021-01-15 08:31:43.877000','20','第八篇博客',3,'',1,1),(67,'2021-01-15 08:31:43.879000','18','第七篇博客',3,'',1,1),(68,'2021-01-15 08:31:43.880000','17','第六篇博客',3,'',1,1),(69,'2021-01-15 08:31:43.882000','16','第五篇博客',3,'',1,1),(70,'2021-01-15 08:31:43.884000','13','第二篇博客',3,'',1,1),(71,'2021-01-15 08:31:43.885000','12','第一篇博客',3,'',1,1),(72,'2021-01-15 08:32:24.292000','56','计数测试9',3,'',1,1),(73,'2021-01-15 08:32:46.709000','55','计数测试8',3,'',1,1),(74,'2021-01-15 08:32:46.711000','54','计数测试7',3,'',1,1),(75,'2021-01-15 08:32:57.026000','52','计数测试5',3,'',1,1),(76,'2021-01-15 08:32:57.029000','51','计数测试4',3,'',1,1),(77,'2021-01-15 08:32:57.030000','50','计数测试3',3,'',1,1),(78,'2021-01-15 08:32:57.032000','49','计数测试2',3,'',1,1),(79,'2021-01-15 08:33:03.589000','48','计数测试',3,'',1,1),(80,'2021-01-15 08:33:11.298000','46','图片测试',3,'',1,1),(81,'2021-01-15 08:33:21.835000','30','codesnippet测试',3,'',1,1),(82,'2021-01-15 08:33:21.837000','29','图片',3,'',1,1),(83,'2021-01-15 08:33:21.838000','28','ckeditor测试',3,'',1,1),(84,'2021-01-15 08:33:21.840000','27','CKEDITOR Test',3,'',1,1),(85,'2021-01-15 08:33:21.841000','26','测试汉化',3,'',1,1),(86,'2021-01-15 08:33:33.340000','24','第九篇博客',3,'',1,1),(87,'2021-01-15 08:33:33.343000','20','第八篇博客',3,'',1,1),(88,'2021-01-15 08:33:33.344000','18','第七篇博客',3,'',1,1),(89,'2021-01-15 08:33:33.346000','17','第六篇博客',3,'',1,1),(90,'2021-01-15 08:33:42.225000','16','第五篇博客',3,'',1,1),(91,'2021-01-15 08:33:42.228000','13','第二篇博客',3,'',1,1),(92,'2021-01-15 08:33:42.229000','12','第一篇博客',3,'',1,1),(93,'2021-01-15 09:08:20.724000','13','ViewCount object (13)',1,'[{\"added\": {}}]',10,1),(94,'2021-01-17 12:54:10.952000','1','ViewCount object (1)',1,'[{\"added\": {}}]',11,1),(95,'2021-01-17 13:55:42.326000','2','ViewCount object (2)',1,'[{\"added\": {}}]',11,1),(96,'2021-01-17 13:55:57.681000','3','ViewCount object (3)',1,'[{\"added\": {}}]',11,1),(97,'2021-01-19 07:13:27.599000','62','日期测试',1,'[{\"added\": {}}]',1,1),(98,'2021-01-20 01:17:19.316000','1','ViewDetail object (1)',1,'[{\"added\": {}}]',12,1),(99,'2021-01-20 14:11:33.740000','6','ViewDetail object (6)',1,'[{\"added\": {}}]',12,1),(100,'2021-01-20 14:13:49.961000','11','8',2,'[{\"changed\": {\"fields\": [\"count\"]}}]',11,1),(101,'2021-01-28 03:05:52.269000','1','PostTag object (1)',1,'[{\"added\": {}}]',13,1),(102,'2021-02-01 01:20:36.921000','2','django',1,'[{\"added\": {}}]',13,1),(103,'2021-02-01 01:20:42.096000','2','django',2,'[]',13,1),(104,'2021-02-01 03:47:28.498000','3','other',1,'[{\"added\": {}}]',13,1),(105,'2021-02-01 05:02:19.282000','3','other',2,'[{\"changed\": {\"fields\": [\"slug\"]}}]',13,1),(106,'2021-02-01 05:02:24.678000','2','django',2,'[{\"changed\": {\"fields\": [\"slug\"]}}]',13,1),(107,'2021-02-01 05:02:29.214000','1','sql',2,'[{\"changed\": {\"fields\": [\"slug\"]}}]',13,1),(108,'2021-02-01 05:03:51.211000','3','其它',2,'[{\"changed\": {\"fields\": [\"tag_name\"]}}]',13,1),(109,'2021-02-01 13:19:42.508000','4','python',1,'[{\"added\": {}}]',13,1),(110,'2021-02-01 13:21:30.307000','5','数据结构',1,'[{\"added\": {}}]',13,1),(111,'2021-02-01 13:49:54.426000','6','算法',1,'[{\"added\": {}}]',13,1),(112,'2021-02-02 04:07:18.867000','95','ceshi',3,'',1,1),(113,'2021-02-02 04:07:18.868000','94','ceshi',3,'',1,1),(114,'2021-02-02 04:07:18.870000','93','cesgu',3,'',1,1),(115,'2021-02-02 04:07:18.872000','92','ceshi',3,'',1,1),(116,'2021-02-02 04:07:18.873000','91','ceshi',3,'',1,1),(117,'2021-02-02 04:07:18.874000','90','ceshi',3,'',1,1),(118,'2021-02-02 04:07:18.876000','89','ceshi',3,'',1,1),(119,'2021-02-02 04:07:18.877000','88','cesgu',3,'',1,1),(120,'2021-02-02 04:07:18.878000','87','cesgu',3,'',1,1),(121,'2021-02-02 04:07:18.880000','86','cesgu',3,'',1,1),(122,'2021-02-02 04:07:18.881000','85','cesgu',3,'',1,1),(123,'2021-02-02 04:07:18.882000','84','ceshi',3,'',1,1),(124,'2021-02-02 04:07:18.883000','83','ceshi',3,'',1,1),(125,'2021-02-02 04:07:18.885000','82','ceshi',3,'',1,1),(126,'2021-02-02 04:07:18.886000','81','ceshi',3,'',1,1),(127,'2021-02-02 04:07:18.887000','80','ceshi',3,'',1,1),(128,'2021-02-02 04:07:18.889000','79','ceshi',3,'',1,1),(129,'2021-02-02 04:07:18.892000','78','ceshi',3,'',1,1),(130,'2021-02-02 04:07:18.893000','77','ceshi',3,'',1,1),(131,'2021-02-02 04:07:18.895000','76','ceshi',3,'',1,1),(132,'2021-02-02 04:07:18.896000','75','ceshi',3,'',1,1),(133,'2021-02-02 04:07:18.898000','74','ceshi',3,'',1,1),(134,'2021-02-02 04:07:18.900000','73','ceshi',3,'',1,1),(135,'2021-02-02 04:07:18.902000','72','ceshi',3,'',1,1),(136,'2021-02-02 04:07:18.904000','71','ceshi',3,'',1,1),(137,'2021-02-02 04:07:18.906000','70','ceshi',3,'',1,1),(138,'2021-02-02 04:07:18.914000','69','测试',3,'',1,1),(139,'2021-02-02 04:07:18.919000','68','测试多选',3,'',1,1),(140,'2021-02-10 06:37:17.115000','62','日期测试',3,'',1,1),(141,'2021-02-10 06:37:17.118000','61','测试信号2',3,'',1,1),(142,'2021-02-10 06:37:17.120000','60','测试信号',3,'',1,1),(143,'2021-02-10 06:37:17.122000','59','计数测试12',3,'',1,1),(144,'2021-02-10 06:37:17.123000','58','计数测试11',3,'',1,1),(145,'2021-02-10 06:37:17.125000','57','计数测试10',3,'',1,1),(146,'2021-02-10 06:37:17.126000','53','计数测试6',3,'',1,1),(147,'2021-02-10 06:37:17.128000','47','图片测试',3,'',1,1),(148,'2021-02-10 06:37:17.131000','45','图片测试',3,'',1,1),(149,'2021-02-10 06:37:17.133000','43','图片测试',3,'',1,1),(150,'2021-02-10 06:37:17.135000','42','图片测试',3,'',1,1),(151,'2021-02-10 06:37:17.138000','33','图片测试2',3,'',1,1),(152,'2021-02-10 06:37:17.139000','31','代码样例',3,'',1,1),(153,'2021-02-10 06:38:06.238000','522','回复 @testuser10: ceshi',3,'',9,1),(154,'2021-02-10 06:38:06.240000','521','回复 @testuser10: ceshi',3,'',9,1),(155,'2021-02-10 06:38:06.242000','520','回复 @zhaoyanbo: nihao',3,'',9,1),(156,'2021-02-10 06:38:06.243000','519','nihao',3,'',9,1),(157,'2021-02-10 06:38:06.245000','518','回复 @testuser10: nihao',3,'',9,1),(158,'2021-02-10 06:38:06.247000','517','回复 @testuser10: 111',3,'',9,1),(159,'2021-02-10 06:38:06.248000','516','回复 @testuser10: ceshi',3,'',9,1),(160,'2021-02-10 06:38:06.250000','515','回复 @testuser10: ceshi',3,'',9,1),(161,'2021-02-10 06:38:06.251000','514','回复 @testuser10: ceshi',3,'',9,1),(162,'2021-02-10 06:38:06.253000','513','回复 @testuser10: ceshi',3,'',9,1),(163,'2021-02-10 06:38:06.255000','512','回复 @testuser10: nihao',3,'',9,1),(164,'2021-02-10 06:38:06.258000','511','回复 @zhaoyanbo: nihao',3,'',9,1),(165,'2021-02-10 06:38:06.260000','510','回复 @testuser10: 你好',3,'',9,1),(166,'2021-02-10 06:38:06.262000','509','回复 @zhaoyanbo: 写的还可以',3,'',9,1),(167,'2021-02-10 06:38:06.263000','508','回复 @testuser10: 写的不行',3,'',9,1),(168,'2021-02-10 06:38:06.265000','507','回复 @testuser10: 测试',3,'',9,1),(169,'2021-02-10 06:38:06.267000','506','回复 @testuser10: ceshi',3,'',9,1),(170,'2021-02-10 06:38:06.268000','505','回复 @testuser10: 不错',3,'',9,1),(171,'2021-02-10 06:38:06.270000','504','写的还行',3,'',9,1),(172,'2021-02-10 06:38:06.273000','503','回复 @testuser10: 测试',3,'',9,1),(173,'2021-02-10 06:38:06.275000','502','回复 @testuser10: 测试',3,'',9,1),(174,'2021-02-10 06:38:06.277000','501','回复 @testuser10: 测试',3,'',9,1),(175,'2021-02-10 06:38:06.279000','500','回复 @testuser10: 测试吧',3,'',9,1),(176,'2021-02-10 06:38:06.281000','499','回复 @testuser10:',3,'',9,1),(177,'2021-02-10 06:38:06.282000','498','回复 @testuser10: 不行',3,'',9,1),(178,'2021-02-10 06:38:06.283000','497','回复 @testuser10: ceshi',3,'',9,1),(179,'2021-02-10 06:38:06.285000','496','回复 @testuser10: 你好',3,'',9,1),(180,'2021-02-10 06:38:06.287000','495','回复 @testuser10: ceshi',3,'',9,1),(181,'2021-02-10 06:38:06.288000','494','cehishi',3,'',9,1),(182,'2021-02-10 06:38:06.290000','493','回复 @testuser10: ceshi',3,'',9,1),(183,'2021-02-10 06:38:06.292000','492','回复 @testuser10: 你好',3,'',9,1),(184,'2021-02-10 06:38:06.293000','491','回复 @testuser10: ceshi',3,'',9,1),(185,'2021-02-10 06:38:06.295000','490','回复 @testuser10: ceshi',3,'',9,1),(186,'2021-02-10 06:38:06.297000','489','回复 @testuser10: ceshi',3,'',9,1),(187,'2021-02-10 06:38:06.299000','488','回复 @testuser10: ceshi',3,'',9,1),(188,'2021-02-10 06:38:06.301000','487','回复 @testuser10: ceshi',3,'',9,1),(189,'2021-02-10 06:38:06.305000','486','回复 @testuser10: ceshi',3,'',9,1),(190,'2021-02-10 06:38:06.306000','485','回复 @testuser10: ceshi',3,'',9,1),(191,'2021-02-10 06:38:06.308000','484','回复 @testuser10: ceshi',3,'',9,1),(192,'2021-02-10 06:38:06.310000','483','ceshi',3,'',9,1),(193,'2021-02-10 06:38:06.312000','482','回复 @testuser10: ceshi',3,'',9,1),(194,'2021-02-10 06:38:06.314000','481','回复 @testuser10: ceshi',3,'',9,1),(195,'2021-02-10 06:38:06.315000','480','回复 @testuser10: ceshi',3,'',9,1),(196,'2021-02-10 06:38:06.317000','479','回复 @testuser10: ceshi',3,'',9,1),(197,'2021-02-10 06:38:06.318000','478','ceshi',3,'',9,1),(198,'2021-02-10 06:38:06.320000','477','回复 @testuser10: ceshi',3,'',9,1),(199,'2021-02-10 06:38:06.322000','476','回复 @testuser10: ceshi',3,'',9,1),(200,'2021-02-10 06:38:06.323000','475','ceshi',3,'',9,1),(201,'2021-02-10 06:38:06.327000','474','回复 @testuser10: ceshi',3,'',9,1),(202,'2021-02-10 06:38:06.331000','473','回复 @testuser10: ceshi',3,'',9,1),(203,'2021-02-10 06:38:06.332000','472','ceshi',3,'',9,1),(204,'2021-02-10 06:38:06.334000','471','回复 @testuser10: ceshi',3,'',9,1),(205,'2021-02-10 06:38:06.336000','470','回复 @testuser10: ceshi',3,'',9,1),(206,'2021-02-10 06:38:06.339000','469','ceshi',3,'',9,1),(207,'2021-02-10 06:38:06.341000','468','ceshi',3,'',9,1),(208,'2021-02-10 06:38:06.344000','467','ceshiceshi',3,'',9,1),(209,'2021-02-10 06:38:06.346000','466','回复 @testuser10: ceshi',3,'',9,1),(210,'2021-02-10 06:38:06.347000','465','回复 @testuser10: ceshi',3,'',9,1),(211,'2021-02-10 06:38:06.349000','464','回复 @testuser10: ceshi',3,'',9,1),(212,'2021-02-10 06:38:06.351000','463','ceshi',3,'',9,1),(213,'2021-02-10 06:38:06.353000','462','ceshi',3,'',9,1),(214,'2021-02-10 06:38:06.355000','461','ceshi',3,'',9,1),(215,'2021-02-10 06:38:06.356000','460','ceshi',3,'',9,1),(216,'2021-02-10 06:38:06.358000','459','ceshi',3,'',9,1),(217,'2021-02-10 06:38:06.360000','458','ceshi',3,'',9,1),(218,'2021-02-10 06:38:06.362000','457','ceshi',3,'',9,1),(219,'2021-02-10 06:38:06.364000','456','ceshi',3,'',9,1),(220,'2021-02-10 06:38:06.366000','455','ceshi',3,'',9,1),(221,'2021-02-10 06:38:06.367000','454','ceshi',3,'',9,1),(222,'2021-02-10 06:38:06.369000','453','回复 @testuser10: ceshi',3,'',9,1),(223,'2021-02-10 06:38:06.371000','452','回复 @testuser10: ceshi',3,'',9,1),(224,'2021-02-10 06:38:06.373000','451','回复 @testuser10: ceshi',3,'',9,1),(225,'2021-02-10 06:38:06.374000','450','回复 @testuser10: ceshi',3,'',9,1),(226,'2021-02-10 06:38:06.376000','449','回复 @testuser10: ceshi',3,'',9,1),(227,'2021-02-10 06:38:06.378000','448','ceshi',3,'',9,1),(228,'2021-02-10 06:38:06.379000','447','回复 @testuser10: ceshi',3,'',9,1),(229,'2021-02-10 06:38:06.380000','446','ceshi',3,'',9,1),(230,'2021-02-10 06:38:06.382000','445','回复 @testuser10: ceshi',3,'',9,1),(231,'2021-02-10 06:38:06.383000','444','ceshi',3,'',9,1),(232,'2021-02-10 06:38:06.385000','443','回复 @testuser10: ceshi',3,'',9,1),(233,'2021-02-10 06:38:06.386000','442','ceshi',3,'',9,1),(234,'2021-02-10 06:38:06.388000','441','ceshi',3,'',9,1),(235,'2021-02-10 06:38:06.389000','440','回复 @testuser10: ceshi',3,'',9,1),(236,'2021-02-10 06:38:06.391000','439','ceshi',3,'',9,1),(237,'2021-02-10 06:38:06.392000','438','回复 @testuser10: ceshi',3,'',9,1),(238,'2021-02-10 06:38:06.394000','437','ceshi',3,'',9,1),(239,'2021-02-10 06:38:06.395000','436','回复 @testuser10: ceshi',3,'',9,1),(240,'2021-02-10 06:38:06.397000','435','ceshi',3,'',9,1),(241,'2021-02-10 06:38:06.398000','434','回复 @testuser10: ceshi',3,'',9,1),(242,'2021-02-10 06:38:06.399000','433','ceshi',3,'',9,1),(243,'2021-02-10 06:38:06.401000','432','回复 @testuser10: ceshi',3,'',9,1),(244,'2021-02-10 06:38:06.403000','431','ceshi',3,'',9,1),(245,'2021-02-10 06:38:06.404000','430','回复 @testuser10: ceshi',3,'',9,1),(246,'2021-02-10 06:38:06.406000','429','ceshi',3,'',9,1),(247,'2021-02-10 06:38:06.408000','428','回复 @testuser10: ceshi',3,'',9,1),(248,'2021-02-10 06:38:06.410000','427','ceshi ',3,'',9,1),(249,'2021-02-10 06:38:06.411000','426','回复 @testuser10: ceshi',3,'',9,1),(250,'2021-02-10 06:38:06.413000','425','回复 @testuser10: ceshi',3,'',9,1),(251,'2021-02-10 06:38:06.414000','424','ceshi',3,'',9,1),(252,'2021-02-10 06:38:06.416000','423','回复 @testuser10: ceshi',3,'',9,1),(253,'2021-02-10 06:39:26.914000','422','回复 @testuser10: ceshi',3,'',9,1),(254,'2021-02-10 06:39:26.916000','421','ceshi',3,'',9,1),(255,'2021-02-10 06:39:26.918000','420','ceshi',3,'',9,1),(256,'2021-02-10 06:39:26.921000','419','回复 @testuser10: ceshi',3,'',9,1),(257,'2021-02-10 06:39:26.923000','418','ceshi',3,'',9,1),(258,'2021-02-10 06:39:26.925000','417','回复 @testuser10: 测试股',3,'',9,1),(259,'2021-02-10 06:39:26.927000','416','回复 @testuser10: 测试',3,'',9,1),(260,'2021-02-10 06:39:26.928000','415','测试',3,'',9,1),(261,'2021-02-10 06:39:26.930000','414','回复 @testuser10: 测试',3,'',9,1),(262,'2021-02-10 06:39:26.932000','413','测试',3,'',9,1),(263,'2021-02-10 06:39:26.934000','412','回复 @testuser10: 测试',3,'',9,1),(264,'2021-02-10 06:39:26.935000','411','测试',3,'',9,1),(265,'2021-02-10 06:39:26.938000','410','回复 @testuser10: 测试',3,'',9,1),(266,'2021-02-10 06:39:26.941000','409','回复 @testuser10: 你好\n',3,'',9,1),(267,'2021-02-10 06:39:26.942000','408','测试',3,'',9,1),(268,'2021-02-10 06:39:26.944000','407','回复 @testuser10: 你好',3,'',9,1),(269,'2021-02-10 06:39:26.945000','406','回复 @testuser10: 你好',3,'',9,1),(270,'2021-02-10 06:39:26.947000','405','测试',3,'',9,1),(271,'2021-02-10 06:39:26.949000','404','回复 @testuser10: 你好',3,'',9,1),(272,'2021-02-10 06:39:26.950000','403','回复 @testuser10: ceshi',3,'',9,1),(273,'2021-02-10 06:39:26.952000','402','回复 @testuser10: ceshi',3,'',9,1),(274,'2021-02-10 06:39:26.954000','401','回复 @testuser10: ceshi',3,'',9,1),(275,'2021-02-10 06:39:26.955000','400','ceshi',3,'',9,1),(276,'2021-02-10 06:39:26.957000','399','测试',3,'',9,1),(277,'2021-02-10 06:39:26.958000','398','ceshi',3,'',9,1),(278,'2021-02-10 06:39:26.960000','397','测试',3,'',9,1),(279,'2021-02-10 06:39:26.961000','396','测试',3,'',9,1),(280,'2021-02-10 06:39:26.963000','395','测试',3,'',9,1),(281,'2021-02-10 06:39:26.966000','394','回复 @testuser10: 你好',3,'',9,1),(282,'2021-02-10 06:39:26.968000','393','回复 @testuser10: ceshi',3,'',9,1),(283,'2021-02-10 06:39:26.973000','392','回复 @testuser10: ceshi',3,'',9,1),(284,'2021-02-10 06:39:26.982000','391','回复 @testuser10: ceshi',3,'',9,1),(285,'2021-02-10 06:39:26.985000','390','回复 @testuser10: ceshi',3,'',9,1),(286,'2021-02-10 06:39:26.987000','389','回复 @zhaoyanbo: ceshi',3,'',9,1),(287,'2021-02-10 06:39:26.991000','388','回复 @testuser10: ceshi',3,'',9,1),(288,'2021-02-10 06:39:27.000000','387','回复 @testuser10: ceshi',3,'',9,1),(289,'2021-02-10 06:39:27.002000','386','回复 @zhaoyanbo: ceshi',3,'',9,1),(290,'2021-02-10 06:39:27.012000','385','ceshi',3,'',9,1),(291,'2021-02-10 06:39:27.015000','384','回复 @zhaoyanbo: 测试',3,'',9,1),(292,'2021-02-10 06:39:27.016000','383','回复 @zhaoyanbo: 测试',3,'',9,1),(293,'2021-02-10 06:39:27.018000','382','回复 @zhaoyanbo: 你好',3,'',9,1),(294,'2021-02-10 06:39:27.020000','381','回复 @zhaoyanbo: 八条回复',3,'',9,1),(295,'2021-02-10 06:39:27.022000','380','回复 @zhaoyanbo: 你好',3,'',9,1),(296,'2021-02-10 06:39:27.023000','379','回复 @zhaoyanbo: 测试',3,'',9,1),(297,'2021-02-10 06:39:27.025000','378','回复 @zhaoyanbo: ceshi',3,'',9,1),(298,'2021-02-10 06:39:27.027000','377','回复 @zhaoyanbo: ceshi',3,'',9,1),(299,'2021-02-10 06:39:27.032000','376','回复 @zhaoyanbo: ceshi',3,'',9,1),(300,'2021-02-10 06:39:27.035000','375','回复 @zhaoyanbo: ceshi',3,'',9,1),(301,'2021-02-10 06:39:27.036000','374','回复 @zhaoyanbo: ceshi',3,'',9,1),(302,'2021-02-10 06:39:27.038000','373','ceshi',3,'',9,1),(303,'2021-02-10 06:39:27.040000','372','回复 @zhaoyanbo: ceshi',3,'',9,1),(304,'2021-02-10 06:39:27.041000','371','回复 @zhaoyanbo: 测试',3,'',9,1),(305,'2021-02-10 06:39:27.043000','370','回复',3,'',9,1),(306,'2021-02-10 06:39:27.045000','369','回复 @zhaoyanbo: ceshi',3,'',9,1),(307,'2021-02-10 06:39:27.048000','368','回复 @zhaoyanbo: 测试',3,'',9,1),(308,'2021-02-10 06:39:27.050000','367','回复 @zhaoyanbo: 测试',3,'',9,1),(309,'2021-02-10 06:39:27.051000','366','回复 @zhaoyanbo: ceshi',3,'',9,1),(310,'2021-02-10 06:39:27.053000','365','回复 @zhaoyanbo: ceshi',3,'',9,1),(311,'2021-02-10 06:39:27.054000','364','回复 @zhaoyanbo: 测试',3,'',9,1),(312,'2021-02-10 06:39:27.056000','363','回复 @zhaoyanbo: 测试',3,'',9,1),(313,'2021-02-10 06:39:27.058000','362','回复 @zhaoyanbo: 测试',3,'',9,1),(314,'2021-02-10 06:39:27.060000','361','回复 @zhaoyanbo: 测试',3,'',9,1),(315,'2021-02-10 06:39:27.061000','360','测试',3,'',9,1),(316,'2021-02-10 06:39:27.063000','359','回复 @zhaoyanbo: ceshi',3,'',9,1),(317,'2021-02-10 06:39:27.065000','358','回复 @zhaoyanbo: 测试',3,'',9,1),(318,'2021-02-10 06:39:27.066000','357','回复 @zhaoyanbo: 测试',3,'',9,1),(319,'2021-02-10 06:39:27.068000','356','回复 @zhaoyanbo: 你好',3,'',9,1),(320,'2021-02-10 06:39:27.070000','355','回复 @zhaoyanbo: ceshi',3,'',9,1),(321,'2021-02-10 06:39:27.075000','354','回复 @zhaoyanbo: ceshi',3,'',9,1),(322,'2021-02-10 06:39:27.080000','353','回复 @zhaoyanbo: ceshi',3,'',9,1),(323,'2021-02-10 06:39:27.084000','352','回复 @zhaoyanbo: ceshi',3,'',9,1),(324,'2021-02-10 06:39:27.087000','351','回复 @zhaoyanbo: ceshi',3,'',9,1),(325,'2021-02-10 06:39:27.094000','350','cesgu',3,'',9,1),(326,'2021-02-10 06:39:27.095000','349','回复 @zhaoyanbo: ceshi',3,'',9,1),(327,'2021-02-10 06:39:27.099000','348','回复 @zhaoyanbo: ceshi',3,'',9,1),(328,'2021-02-10 06:39:27.101000','347','回复 @zhaoyanbo: ceshi',3,'',9,1),(329,'2021-02-10 06:39:27.104000','346','回复 @zhaoyanbo: ceshi',3,'',9,1),(330,'2021-02-10 06:39:27.105000','345','回复 @zhaoyanbo: ceshi',3,'',9,1),(331,'2021-02-10 06:39:27.108000','344','回复 @zhaoyanbo: ceshi',3,'',9,1),(332,'2021-02-10 06:39:27.109000','343','回复 @zhaoyanbo: ceshi',3,'',9,1),(333,'2021-02-10 06:39:27.111000','342','ceshi',3,'',9,1),(334,'2021-02-10 06:39:27.112000','341','回复 @zhaoyanbo: ceshi',3,'',9,1),(335,'2021-02-10 06:39:27.114000','340','回复 @zhaoyanbo: ceshi',3,'',9,1),(336,'2021-02-10 06:39:27.116000','339','回复 @zhaoyanbo: ceshi',3,'',9,1),(337,'2021-02-10 06:39:27.117000','338','回复 @zhaoyanbo: ceshi',3,'',9,1),(338,'2021-02-10 06:39:27.119000','337','回复 @zhaoyanbo: ceshi',3,'',9,1),(339,'2021-02-10 06:39:27.122000','336','回复 @zhaoyanbo: ceshi ',3,'',9,1),(340,'2021-02-10 06:39:27.123000','335','回复 @zhaoyanbo: 你好',3,'',9,1),(341,'2021-02-10 06:39:27.125000','334','回复 @zhaoyanbo: 测试',3,'',9,1),(342,'2021-02-10 06:39:27.126000','333','回复 @zhaoyanbo: ceshi',3,'',9,1),(343,'2021-02-10 06:39:27.128000','332','回复 @zhaoyanbo: ceshi',3,'',9,1),(344,'2021-02-10 06:39:27.131000','331','回复 @zhaoyanbo: ceshi',3,'',9,1),(345,'2021-02-10 06:39:27.133000','330','回复 @zhaoyanbo: 你好',3,'',9,1),(346,'2021-02-10 06:39:27.134000','329','回复 @zhaoyanbo: 新的回复',3,'',9,1),(347,'2021-02-10 06:39:27.136000','328','回复 @zhaoyanbo: 新的回复',3,'',9,1),(348,'2021-02-10 06:39:27.138000','327','回复 @zhaoyanbo: 新的回复',3,'',9,1),(349,'2021-02-10 06:39:27.139000','326','新的测试',3,'',9,1),(350,'2021-02-10 06:39:27.140000','325','回复 @zhaoyanbo: ceshi',3,'',9,1),(351,'2021-02-10 06:39:27.142000','324','回复 @zhaoyanbo: ceshi',3,'',9,1),(352,'2021-02-10 06:39:27.143000','323','回复 @zhaoyanbo: ceshi',3,'',9,1),(353,'2021-02-10 06:39:33.605000','524','回复 @zhaoyanbo: 测试回复评论',3,'',9,1),(354,'2021-02-10 06:39:33.608000','523','测试评论',3,'',9,1),(355,'2021-02-10 06:39:33.609000','322','回复 @zhaoyanbo: ceshi',3,'',9,1),(356,'2021-02-10 06:39:33.611000','321','回复 @zhaoyanbo: ceshi',3,'',9,1),(357,'2021-02-10 06:39:33.612000','320','回复 @zhaoyanbo: ceshi',3,'',9,1),(358,'2021-02-10 06:39:33.614000','319','回复 @zhaoyanbo: ceshi',3,'',9,1),(359,'2021-02-10 06:39:33.616000','318','回复 @zhaoyanbo: ceshi',3,'',9,1),(360,'2021-02-10 06:39:33.618000','317','回复 @zhaoyanbo: ceshi',3,'',9,1),(361,'2021-02-10 06:39:33.620000','316','回复 @zhaoyanbo: ceshi',3,'',9,1),(362,'2021-02-10 06:39:33.622000','315','回复 @zhaoyanbo: ceshi',3,'',9,1),(363,'2021-02-10 06:39:33.623000','314','回复 @zhaoyanbo: ceshi',3,'',9,1),(364,'2021-02-10 06:39:33.625000','313','回复 @zhaoyanbo: 测试',3,'',9,1),(365,'2021-02-10 06:39:33.627000','312','对抗了',3,'',9,1),(366,'2021-02-10 06:39:33.629000','311','回复 @zhaoyanbo: 不行',3,'',9,1),(367,'2021-02-10 06:39:33.630000','310','回复 @zhaoyanbo: hello',3,'',9,1),(368,'2021-02-10 06:39:33.631000','309','回复 @zhaoyanbo: hello',3,'',9,1),(369,'2021-02-10 06:39:33.633000','308','回复 @zhaoyanbo: hello',3,'',9,1),(370,'2021-02-10 06:39:33.636000','307','回复 @zhaoyanbo: hello',3,'',9,1),(371,'2021-02-10 06:39:33.638000','306','回复 @zhaoyanbo: hello',3,'',9,1),(372,'2021-02-10 06:39:33.640000','305','回复 @zhaoyanbo: hello',3,'',9,1),(373,'2021-02-10 06:39:33.642000','304','回复 @zhaoyanbo: hello',3,'',9,1),(374,'2021-02-10 06:39:33.643000','303','回复 @zhaoyanbo: ceshi',3,'',9,1),(375,'2021-02-10 06:39:33.645000','302','回复 @zhaoyanbo: ceshi',3,'',9,1),(376,'2021-02-10 06:39:33.647000','301','回复 @zhaoyanbo: ceshi',3,'',9,1),(377,'2021-02-10 06:39:33.648000','300','回复 @zhaoyanbo: 测试',3,'',9,1),(378,'2021-02-10 06:39:33.649000','299','你好',3,'',9,1),(379,'2021-02-10 06:39:33.652000','298','回复 @zhaoyanbo: ceshi',3,'',9,1),(380,'2021-02-10 06:39:33.654000','297','回复 @zhaoyanbo: ceshi',3,'',9,1),(381,'2021-02-10 06:39:33.655000','296','回复 @zhaoyanbo: ceshi',3,'',9,1),(382,'2021-02-10 06:39:33.657000','295','回复 @zhaoyanbo: ceshi',3,'',9,1),(383,'2021-02-10 06:39:33.658000','294','回复 @zhaoyanbo: ceshi',3,'',9,1),(384,'2021-02-10 06:39:33.660000','293','回复 @zhaoyanbo: ceshi',3,'',9,1),(385,'2021-02-10 06:39:33.662000','292','回复 @zhaoyanbo: ceshi',3,'',9,1),(386,'2021-02-10 06:39:33.663000','291','回复 @zhaoyanbo: ceshi',3,'',9,1),(387,'2021-02-10 06:39:33.665000','290','回复 @zhaoyanbo: ceshi',3,'',9,1),(388,'2021-02-10 06:39:33.666000','289','回复 @zhaoyanbo: ceshi ',3,'',9,1),(389,'2021-02-10 06:39:33.669000','288','回复 @zhaoyanbo: ceshi',3,'',9,1),(390,'2021-02-10 06:39:33.670000','287','回复 @zhaoyanbo: ceshi',3,'',9,1),(391,'2021-02-10 06:39:33.672000','286','回复 @zhaoyanbo: ceshi',3,'',9,1),(392,'2021-02-10 06:39:33.673000','285','回复 @zhaoyanbo: ceshi',3,'',9,1),(393,'2021-02-10 06:39:33.675000','284','回复 @zhaoyanbo: ceshi',3,'',9,1),(394,'2021-02-10 06:39:33.677000','283','回复 @zhaoyanbo: ceshi',3,'',9,1),(395,'2021-02-10 06:39:33.679000','282','回复 @zhaoyanbo: ceshi',3,'',9,1),(396,'2021-02-10 06:39:33.686000','281','回复 @zhaoyanbo: ceshi',3,'',9,1),(397,'2021-02-10 06:39:33.688000','280','回复 @zhaoyanbo: ceshi',3,'',9,1),(398,'2021-02-10 06:39:33.690000','279','回复 @zhaoyanbo: ceshi',3,'',9,1),(399,'2021-02-10 06:39:33.691000','278','回复 @zhaoyanbo: ceshi',3,'',9,1),(400,'2021-02-10 06:39:33.693000','277','回复 @zhaoyanbo: ceshi',3,'',9,1),(401,'2021-02-10 06:39:33.695000','276','回复 @zhaoyanbo: 测试',3,'',9,1),(402,'2021-02-10 06:39:33.697000','275','CESHI',3,'',9,1),(403,'2021-02-10 06:39:33.702000','274','还好',3,'',9,1),(404,'2021-02-10 06:39:33.706000','273','可以',3,'',9,1),(405,'2021-02-10 06:39:33.708000','272','可以',3,'',9,1),(406,'2021-02-10 06:39:33.709000','271','这篇可以',3,'',9,1),(407,'2021-02-10 06:39:33.711000','270','这篇可以',3,'',9,1),(408,'2021-02-10 06:39:33.713000','269','ceshi',3,'',9,1),(409,'2021-02-10 06:39:33.715000','268','ceshi',3,'',9,1),(410,'2021-02-10 06:39:33.717000','267','你好',3,'',9,1),(411,'2021-02-10 06:39:33.719000','266','你好',3,'',9,1),(412,'2021-02-10 06:39:33.720000','265','你好',3,'',9,1),(413,'2021-02-10 06:39:33.722000','264','你好',3,'',9,1),(414,'2021-02-10 06:39:33.724000','263','你好',3,'',9,1),(415,'2021-02-10 06:39:33.726000','262','ceshi',3,'',9,1),(416,'2021-02-10 06:39:33.727000','261','ceshi',3,'',9,1),(417,'2021-02-10 06:39:33.729000','260','ceshi',3,'',9,1),(418,'2021-02-10 06:39:33.731000','259','ceshi',3,'',9,1),(419,'2021-02-10 06:39:33.734000','258','ceshi',3,'',9,1),(420,'2021-02-10 06:39:33.736000','257','ceshi',3,'',9,1),(421,'2021-02-10 06:39:33.738000','256','ceshi',3,'',9,1),(422,'2021-02-10 06:39:33.739000','255','ceshi',3,'',9,1),(423,'2021-02-10 06:39:33.741000','254','ceshi',3,'',9,1),(424,'2021-02-10 06:39:33.742000','253','ceshi',3,'',9,1),(425,'2021-02-10 06:39:33.744000','252','测试',3,'',9,1),(426,'2021-02-10 06:39:33.746000','251','测试',3,'',9,1),(427,'2021-02-10 06:39:33.747000','250','回复 @zhaoyanbo: 测试测试',3,'',9,1),(428,'2021-02-10 06:39:33.748000','249','haha',3,'',9,1),(429,'2021-02-10 06:39:33.750000','248','haha',3,'',9,1),(430,'2021-02-10 06:39:33.752000','247','lyq',3,'',9,1),(431,'2021-02-10 06:39:33.753000','246','lyq',3,'',9,1),(432,'2021-02-10 06:39:33.755000','245','zyb',3,'',9,1),(433,'2021-02-10 06:39:33.757000','244','测试',3,'',9,1),(434,'2021-02-10 06:39:33.759000','243','测试',3,'',9,1),(435,'2021-02-10 06:39:33.760000','242','测试测试测试\n\n',3,'',9,1),(436,'2021-02-10 06:39:33.762000','241','测试测试',3,'',9,1),(437,'2021-02-10 06:39:33.764000','240','测试',3,'',9,1),(438,'2021-02-10 06:39:33.766000','239','ceshi',3,'',9,1),(439,'2021-02-10 06:39:33.768000','238','你好',3,'',9,1),(440,'2021-02-10 06:39:33.770000','237','测试',3,'',9,1),(441,'2021-02-10 06:39:33.772000','236','你好',3,'',9,1),(442,'2021-02-10 06:39:33.773000','235','ceshi',3,'',9,1),(443,'2021-02-10 06:39:33.775000','234','ceshi',3,'',9,1),(444,'2021-02-10 06:39:33.776000','233','你好',3,'',9,1),(445,'2021-02-10 06:39:33.778000','232','ceshi',3,'',9,1),(446,'2021-02-10 06:39:33.782000','231','ceshi\n',3,'',9,1),(447,'2021-02-10 06:39:33.783000','230','测试',3,'',9,1),(448,'2021-02-10 06:39:33.784000','229','ceshi',3,'',9,1),(449,'2021-02-10 06:39:33.788000','228','测试',3,'',9,1),(450,'2021-02-10 06:39:33.789000','227','测试',3,'',9,1),(451,'2021-02-10 06:39:33.792000','226','ceshi',3,'',9,1),(452,'2021-02-10 06:39:33.797000','225','ceshi',3,'',9,1),(453,'2021-02-10 06:39:39.920000','224','ceshi',3,'',9,1),(454,'2021-02-10 06:39:39.923000','223','ceshi',3,'',9,1),(455,'2021-02-10 06:39:39.925000','222','ceshi',3,'',9,1),(456,'2021-02-10 06:39:39.926000','221','ceshi',3,'',9,1),(457,'2021-02-10 06:39:39.928000','220','ceshi',3,'',9,1),(458,'2021-02-10 06:39:39.929000','219','ceshi',3,'',9,1),(459,'2021-02-10 06:39:39.931000','218','ceshi',3,'',9,1),(460,'2021-02-10 06:39:39.934000','217','ceshi',3,'',9,1),(461,'2021-02-10 06:39:39.936000','216','ceshi',3,'',9,1),(462,'2021-02-10 06:39:39.937000','215','CESHI',3,'',9,1),(463,'2021-02-10 06:39:39.939000','214','ceshi',3,'',9,1),(464,'2021-02-10 06:39:39.941000','213','good',3,'',9,1),(465,'2021-02-10 06:39:39.943000','212','ceshi',3,'',9,1),(466,'2021-02-10 06:39:39.944000','211','ceshi',3,'',9,1),(467,'2021-02-10 06:39:39.946000','210','你好',3,'',9,1),(468,'2021-02-10 06:39:39.948000','209','ceshi',3,'',9,1),(469,'2021-02-10 06:39:39.949000','208','nihao',3,'',9,1),(470,'2021-02-10 06:39:39.953000','207','你好',3,'',9,1),(471,'2021-02-10 06:39:39.955000','206','nihao',3,'',9,1),(472,'2021-02-10 06:39:39.960000','205','nihao',3,'',9,1),(473,'2021-02-10 06:39:39.964000','204','nihao',3,'',9,1),(474,'2021-02-10 06:39:39.966000','203','nihao',3,'',9,1),(475,'2021-02-10 06:39:39.973000','202','nihao',3,'',9,1),(476,'2021-02-10 06:39:39.979000','201','你好',3,'',9,1),(477,'2021-02-10 06:39:39.983000','200','你好',3,'',9,1),(478,'2021-02-10 06:39:39.986000','199','对抗了',3,'',9,1),(479,'2021-02-10 06:39:39.988000','198','对抗了',3,'',9,1),(480,'2021-02-10 06:39:39.990000','197','对抗了',3,'',9,1),(481,'2021-02-10 06:39:39.992000','196','测试',3,'',9,1),(482,'2021-02-10 06:39:39.993000','195','测试',3,'',9,1),(483,'2021-02-10 06:39:39.995000','194','测试',3,'',9,1),(484,'2021-02-10 06:39:39.997000','193','测试',3,'',9,1),(485,'2021-02-10 06:39:40.001000','192','测试',3,'',9,1),(486,'2021-02-10 06:39:40.005000','191','测试',3,'',9,1),(487,'2021-02-10 06:39:40.006000','190','测试',3,'',9,1),(488,'2021-02-10 06:39:40.008000','189','你好',3,'',9,1),(489,'2021-02-10 06:39:40.009000','188','你好',3,'',9,1),(490,'2021-02-10 06:39:40.011000','187','你好',3,'',9,1),(491,'2021-02-10 06:39:40.015000','186','你好',3,'',9,1),(492,'2021-02-10 06:39:40.018000','185','ceshi',3,'',9,1),(493,'2021-02-10 06:39:40.020000','184','你好',3,'',9,1),(494,'2021-02-10 06:39:40.023000','183','你好',3,'',9,1),(495,'2021-02-10 06:39:40.024000','182','你好',3,'',9,1),(496,'2021-02-10 06:39:40.026000','181','你好',3,'',9,1),(497,'2021-02-10 06:39:40.027000','180','ceshi',3,'',9,1),(498,'2021-02-10 06:39:40.029000','179','测试',3,'',9,1),(499,'2021-02-10 06:39:40.030000','178','测试',3,'',9,1),(500,'2021-02-10 06:39:40.032000','177','测试',3,'',9,1),(501,'2021-02-10 06:39:40.033000','176','测试',3,'',9,1),(502,'2021-02-10 06:39:40.035000','175','测试',3,'',9,1),(503,'2021-02-10 06:39:40.036000','174','测试',3,'',9,1),(504,'2021-02-10 06:39:40.038000','173','测试',3,'',9,1),(505,'2021-02-10 06:39:40.039000','172','测试',3,'',9,1),(506,'2021-02-10 06:39:40.041000','171','测试',3,'',9,1),(507,'2021-02-10 06:39:40.043000','170','测试',3,'',9,1),(508,'2021-02-10 06:39:40.045000','169','测试',3,'',9,1),(509,'2021-02-10 06:39:40.048000','168','测试',3,'',9,1),(510,'2021-02-10 06:39:40.053000','167','测试',3,'',9,1),(511,'2021-02-10 06:39:40.058000','166','测试',3,'',9,1),(512,'2021-02-10 06:39:40.060000','165','你好',3,'',9,1),(513,'2021-02-10 06:39:40.069000','164','你好',3,'',9,1),(514,'2021-02-10 06:39:40.071000','163','你好',3,'',9,1),(515,'2021-02-10 06:39:40.073000','162','你好',3,'',9,1),(516,'2021-02-10 06:39:40.076000','161','你好',3,'',9,1),(517,'2021-02-10 06:39:40.078000','160','你好',3,'',9,1),(518,'2021-02-10 06:39:40.082000','159','ceshi',3,'',9,1),(519,'2021-02-10 06:39:40.083000','158','ceshi',3,'',9,1),(520,'2021-02-10 06:39:40.085000','157','ceshi',3,'',9,1),(521,'2021-02-10 06:39:40.086000','156','ceshi',3,'',9,1),(522,'2021-02-10 06:39:40.089000','155','ceshi',3,'',9,1),(523,'2021-02-10 06:39:40.091000','154','ceshi',3,'',9,1),(524,'2021-02-10 06:39:40.092000','153','ceshi',3,'',9,1),(525,'2021-02-10 06:39:40.094000','152','ceshi',3,'',9,1),(526,'2021-02-10 06:39:40.095000','151','ceshi',3,'',9,1),(527,'2021-02-10 06:39:40.097000','150','ceshi',3,'',9,1),(528,'2021-02-10 06:39:40.098000','149','ceshi',3,'',9,1),(529,'2021-02-10 06:39:40.100000','148','ceshi',3,'',9,1),(530,'2021-02-10 06:39:40.102000','147','ceshi',3,'',9,1),(531,'2021-02-10 06:39:40.103000','146','ceshi',3,'',9,1),(532,'2021-02-10 06:39:40.105000','145','回复 @zhaoyanbo: ceshi',3,'',9,1),(533,'2021-02-10 06:39:40.107000','144','回复 @zhaoyanbo: ceshi',3,'',9,1),(534,'2021-02-10 06:39:40.109000','143','ceshi',3,'',9,1),(535,'2021-02-10 06:39:40.111000','142','ceshi',3,'',9,1),(536,'2021-02-10 06:39:40.112000','141','ceshi',3,'',9,1),(537,'2021-02-10 06:39:40.114000','140','ceshi',3,'',9,1),(538,'2021-02-10 06:39:40.116000','139','ceshi',3,'',9,1),(539,'2021-02-10 06:39:40.117000','138','ceshi',3,'',9,1),(540,'2021-02-10 06:39:40.118000','137','ceshi',3,'',9,1),(541,'2021-02-10 06:39:40.120000','136','ceshi',3,'',9,1),(542,'2021-02-10 06:39:40.122000','135','ceshi',3,'',9,1),(543,'2021-02-10 06:39:40.124000','134','ceshi',3,'',9,1),(544,'2021-02-10 06:39:40.125000','133','测试',3,'',9,1),(545,'2021-02-10 06:39:40.127000','132','测试',3,'',9,1),(546,'2021-02-10 06:39:40.128000','131','ceshi',3,'',9,1),(547,'2021-02-10 06:39:40.130000','130','ceshi',3,'',9,1),(548,'2021-02-10 06:39:40.131000','129','ceshi',3,'',9,1),(549,'2021-02-10 06:39:40.133000','128','ceshi',3,'',9,1),(550,'2021-02-10 06:39:40.135000','127','ceshi',3,'',9,1),(551,'2021-02-10 06:39:40.141000','126','ceshi',3,'',9,1),(552,'2021-02-10 06:39:40.142000','125','ceshi',3,'',9,1),(553,'2021-02-10 06:39:45.661000','124','测试',3,'',9,1),(554,'2021-02-10 06:39:45.664000','123','测试',3,'',9,1),(555,'2021-02-10 06:39:45.665000','122','ceshi',3,'',9,1),(556,'2021-02-10 06:39:45.667000','121','回复 @zhaoyanbo: 测试了测试了',3,'',9,1),(557,'2021-02-10 06:39:45.669000','120','测试了测试了',3,'',9,1),(558,'2021-02-10 06:39:45.670000','119','ceshi',3,'',9,1),(559,'2021-02-10 06:39:45.672000','118','ceshi',3,'',9,1),(560,'2021-02-10 06:39:45.674000','117','ceshi',3,'',9,1),(561,'2021-02-10 06:39:45.676000','116','ceshi',3,'',9,1),(562,'2021-02-10 06:39:45.678000','115','ceshi',3,'',9,1),(563,'2021-02-10 06:39:45.680000','114','测试',3,'',9,1),(564,'2021-02-10 06:39:45.682000','113','回复 @zhaoyanbo: 你好',3,'',9,1),(565,'2021-02-10 06:39:45.683000','112','大家好',3,'',9,1),(566,'2021-02-10 06:39:45.685000','111','ceshi',3,'',9,1),(567,'2021-02-10 06:39:45.687000','110','ceshi',3,'',9,1),(568,'2021-02-10 06:39:45.688000','109','ceshi',3,'',9,1),(569,'2021-02-10 06:39:45.690000','108','测试',3,'',9,1),(570,'2021-02-10 06:39:45.691000','107','测试',3,'',9,1),(571,'2021-02-10 06:39:45.693000','106','测试',3,'',9,1),(572,'2021-02-10 06:39:45.696000','105','测试',3,'',9,1),(573,'2021-02-10 06:39:45.698000','104','测试7',3,'',9,1),(574,'2021-02-10 06:39:45.700000','103','测试6',3,'',9,1),(575,'2021-02-10 06:39:45.702000','102','测试5',3,'',9,1),(576,'2021-02-10 06:39:45.703000','101','测试4',3,'',9,1),(577,'2021-02-10 06:39:45.705000','100','测试3',3,'',9,1),(578,'2021-02-10 06:39:45.707000','99','测试2',3,'',9,1),(579,'2021-02-10 06:39:45.708000','98','测试1',3,'',9,1),(580,'2021-02-10 06:39:45.710000','97','测试1',3,'',9,1),(581,'2021-02-10 06:39:45.712000','96','测试',3,'',9,1),(582,'2021-02-10 06:39:45.713000','95','测试',3,'',9,1),(583,'2021-02-10 06:39:45.715000','94','你好',3,'',9,1),(584,'2021-02-10 06:39:45.717000','93','你好',3,'',9,1),(585,'2021-02-10 06:39:45.719000','92','你好',3,'',9,1),(586,'2021-02-10 06:39:45.720000','91','nihai',3,'',9,1),(587,'2021-02-10 06:39:45.722000','90','nihai',3,'',9,1),(588,'2021-02-10 06:39:45.723000','89','nihai',3,'',9,1),(589,'2021-02-10 06:39:45.726000','88','nihai',3,'',9,1),(590,'2021-02-10 06:39:45.735000','87','nihai',3,'',9,1),(591,'2021-02-10 06:39:45.738000','86','nihai',3,'',9,1),(592,'2021-02-10 06:39:45.739000','85','nihai',3,'',9,1),(593,'2021-02-10 06:39:45.741000','84','测试',3,'',9,1),(594,'2021-02-10 06:39:45.742000','83','回复 @zhaoyanbo: ceshihuifu',3,'',9,1),(595,'2021-02-10 06:39:45.744000','82','ceshi',3,'',9,1),(596,'2021-02-10 06:39:45.747000','81','回复 @zhaoyanbo: 测试回复',3,'',9,1),(597,'2021-02-10 06:39:45.748000','80','测试',3,'',9,1),(598,'2021-02-10 06:39:45.750000','79','测试',3,'',9,1),(599,'2021-02-10 06:39:45.751000','78','ceshi',3,'',9,1),(600,'2021-02-10 06:39:45.753000','77','ceshi',3,'',9,1),(601,'2021-02-10 06:39:45.755000','76','ceshi',3,'',9,1),(602,'2021-02-10 06:39:45.757000','75','ceshi',3,'',9,1),(603,'2021-02-10 06:39:45.761000','74','ceshi',3,'',9,1),(604,'2021-02-10 06:39:45.763000','73','ceshi',3,'',9,1),(605,'2021-02-10 06:39:45.765000','72','ceshi',3,'',9,1),(606,'2021-02-10 06:39:45.767000','71','回复 @zhaoyanbo: 测试评论',3,'',9,1),(607,'2021-02-10 06:39:45.769000','70','测试评论',3,'',9,1),(608,'2021-02-10 06:39:45.770000','69','Varchar类型可用存储可变长字符串, 比定长类型更节省空间. 它需要用1或者2个字节记录长度. Char类型是定长的, 适合存储很短的字符串, 例如密码的MD5值.Varchar类型可用存储可变长字符串, 比定长类型更节省空间. 它需要用1或者2个字节记录长度. Char类型是定长的, 适合存储很短的字符串, 例如密码的MD5值.Varchar类型可用存储可变长字符串, 比定长类型更节省空间.',3,'',9,1),(609,'2021-02-10 06:39:45.772000','68','回复 @testuser10: Varchar类型可用存储可变长字符串, 比定长类型更节省空间. 它需要用1或者2个字节记录长度. Char类型是定长的, 适合存储很短的字符串, 例如密码的MD5值.Varchar类型可用存储可变长字符串, 比定长类型更节省空间. 它需要用1或者2个字节记录长度. Char类型是定长的, 适合存储很短的字符串, 例如密码的MD5值.Varchar类型可用存储可变长',3,'',9,1),(610,'2021-02-10 06:39:45.774000','67','Varchar类型可用存储可变长字符串, 比定长类型更节省空间. 它需要用1或者2个字节记录长度. Char类型是定长的, 适合存储很短的字符串, 例如密码的MD5值.',3,'',9,1),(611,'2021-02-10 06:39:45.775000','66','good',3,'',9,1),(612,'2021-02-10 06:39:45.777000','65','good',3,'',9,1),(613,'2021-02-10 06:39:45.780000','64','回复 @testuser10: good',3,'',9,1),(614,'2021-02-10 06:39:45.781000','63','good',3,'',9,1),(615,'2021-02-10 06:39:45.783000','62','回复 @zhaoyanbo: 测试',3,'',9,1),(616,'2021-02-10 06:39:45.785000','61','回复 @zhaoyanbo: 你好',3,'',9,1),(617,'2021-02-10 06:39:45.788000','60','回复 @zhaoyanbo: 测试',3,'',9,1),(618,'2021-02-10 06:39:45.790000','59','回复 @zhaoyanbo: 测试用户测试',3,'',9,1),(619,'2021-02-10 06:39:45.792000','58','回复 @zhaoyanbo: 回复测试',3,'',9,1),(620,'2021-02-10 06:39:45.793000','57','回复 @zhaoyanbo: 测试',3,'',9,1),(621,'2021-02-10 06:39:45.795000','56','回复 @zhaoyanbo: 测试10',3,'',9,1),(622,'2021-02-10 06:39:45.798000','55','回复 @zhaoyanbo: 你好',3,'',9,1),(623,'2021-02-10 06:39:45.800000','54','你好',3,'',9,1),(624,'2021-02-10 06:39:45.801000','53','你好',3,'',9,1),(625,'2021-02-10 06:39:45.803000','52','你好',3,'',9,1),(626,'2021-02-10 06:39:45.805000','51','回复4',3,'',9,1),(627,'2021-02-10 06:39:45.807000','50','回复3',3,'',9,1),(628,'2021-02-10 06:39:45.808000','49','回复1',3,'',9,1),(629,'2021-02-10 06:39:45.810000','48','测试1',3,'',9,1),(630,'2021-02-10 06:39:45.812000','47','测试测试',3,'',9,1),(631,'2021-02-10 06:39:45.814000','46','测试测试',3,'',9,1),(632,'2021-02-10 06:39:45.815000','45','测试测试测试测试',3,'',9,1),(633,'2021-02-10 06:39:45.817000','44','测试测试测试测试',3,'',9,1),(634,'2021-02-10 06:39:45.818000','43','测试测试',3,'',9,1),(635,'2021-02-10 06:39:45.820000','42','测试9',3,'',9,1),(636,'2021-02-10 06:39:45.822000','41','测试8',3,'',9,1),(637,'2021-02-10 06:39:45.824000','40','测试7',3,'',9,1),(638,'2021-02-10 06:39:45.827000','39','测试6',3,'',9,1),(639,'2021-02-10 06:39:45.831000','38','测试5',3,'',9,1),(640,'2021-02-10 06:39:45.832000','37','测试5',3,'',9,1),(641,'2021-02-10 06:39:45.836000','36','测试4',3,'',9,1),(642,'2021-02-10 06:39:45.838000','35','回复“回复“测试2””',3,'',9,1),(643,'2021-02-10 06:39:45.842000','34','回复“测试2”',3,'',9,1),(644,'2021-02-10 06:39:45.847000','33','测试2',3,'',9,1),(645,'2021-02-10 06:39:45.849000','32','再见',3,'',9,1),(646,'2021-02-10 06:39:45.852000','31','你好',3,'',9,1),(647,'2021-02-10 06:39:45.863000','30','你好',3,'',9,1),(648,'2021-02-10 06:39:45.867000','29','测试1',3,'',9,1),(649,'2021-02-10 06:39:45.872000','28','测试',3,'',9,1),(650,'2021-02-10 06:39:45.876000','27','测试',3,'',9,1),(651,'2021-02-10 06:39:45.881000','26','测试',3,'',9,1),(652,'2021-02-10 06:39:45.883000','25','测试回复',3,'',9,1),(653,'2021-02-10 06:39:53.458000','24','回复“回复“楼主说的对!””',3,'',9,1),(654,'2021-02-10 06:39:53.462000','23','回复“楼主说的对!”',3,'',9,1),(655,'2021-02-10 06:39:53.463000','22','回复“楼主说的对!”',3,'',9,1),(656,'2021-02-10 06:39:53.466000','21','回复“回复“根评论1””',3,'',9,1),(657,'2021-02-10 06:39:53.467000','20','回复“根评论1”',3,'',9,1),(658,'2021-02-10 06:39:53.469000','19','根评论1',3,'',9,1),(659,'2021-02-10 06:39:53.471000','18','hi',3,'',9,1),(660,'2021-02-10 06:39:53.473000','17','你好',3,'',9,1),(661,'2021-02-10 06:39:53.475000','16','good',3,'',9,1),(662,'2021-02-10 06:39:53.477000','15','回复“楼主说的对!”',3,'',9,1),(663,'2021-02-10 06:39:53.478000','14','回复“楼主说的对!”',3,'',9,1),(664,'2021-02-10 06:39:53.480000','13','楼主说的对!',3,'',9,1),(665,'2021-02-10 06:39:53.482000','12','再次回复“这是本站的第6篇评论”',3,'',9,1),(666,'2021-02-10 06:39:53.484000','11','回复“这是本站的第6篇评论”',3,'',9,1),(667,'2021-02-10 06:39:53.485000','10','回复“这是本站的第4篇评论”',3,'',9,1),(668,'2021-02-10 06:39:53.487000','9','回复“这是本站的第5篇评论”',3,'',9,1),(669,'2021-02-10 06:39:53.488000','8','回复“回复“这是本站的第6篇评论” “',3,'',9,1),(670,'2021-02-10 06:39:53.491000','7','回复“这是本站的第6篇评论”',3,'',9,1),(671,'2021-02-10 06:39:53.493000','6','这是本站的第6篇评论',3,'',9,1),(672,'2021-02-10 06:39:53.495000','5','这是本站的第5篇评论',3,'',9,1),(673,'2021-02-10 06:39:53.501000','4','这是本站的第4篇评论',3,'',9,1),(674,'2021-02-10 06:39:53.502000','3','这是本站的第3篇评论',3,'',9,1),(675,'2021-02-10 06:39:53.505000','2','这是本站的第二篇评论',3,'',9,1),(676,'2021-02-10 06:39:53.507000','1','这是本站的第一篇评论',3,'',9,1),(677,'2021-02-10 06:42:56.083000','67','每日总结012820: ajax异步表单提交',2,'[{\"changed\": {\"fields\": [\"content\"]}}]',1,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'admin','logentry'),(4,'auth','group'),(3,'auth','permission'),(5,'auth','user'),(1,'blog','post'),(10,'blog','viewcount'),(9,'comments','comment'),(6,'contenttypes','contenttype'),(7,'sessions','session'),(13,'tag','posttag'),(8,'users','profile'),(11,'viewcount','viewcount'),(12,'viewcount','viewdetail');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2021-02-19 03:52:03.116624'),(2,'auth','0001_initial','2021-02-19 03:52:03.206927'),(3,'admin','0001_initial','2021-02-19 03:52:03.406114'),(4,'admin','0002_logentry_remove_auto_add','2021-02-19 03:52:03.449133'),(5,'admin','0003_logentry_add_action_flag_choices','2021-02-19 03:52:03.457143'),(6,'contenttypes','0002_remove_content_type_name','2021-02-19 03:52:03.505245'),(7,'auth','0002_alter_permission_name_max_length','2021-02-19 03:52:03.529202'),(8,'auth','0003_alter_user_email_max_length','2021-02-19 03:52:03.548427'),(9,'auth','0004_alter_user_username_opts','2021-02-19 03:52:03.556510'),(10,'auth','0005_alter_user_last_login_null','2021-02-19 03:52:03.586872'),(11,'auth','0006_require_contenttypes_0002','2021-02-19 03:52:03.588827'),(12,'auth','0007_alter_validators_add_error_messages','2021-02-19 03:52:03.596734'),(13,'auth','0008_alter_user_username_max_length','2021-02-19 03:52:03.633866'),(14,'auth','0009_alter_user_last_name_max_length','2021-02-19 03:52:03.665972'),(15,'auth','0010_alter_group_name_max_length','2021-02-19 03:52:03.683887'),(16,'auth','0011_update_proxy_permissions','2021-02-19 03:52:03.691843'),(17,'blog','0001_initial','2021-02-19 03:52:03.708589'),(18,'blog','0002_auto_20210113_1247','2021-02-19 03:52:03.736239'),(19,'blog','0003_post_view_num','2021-02-19 03:52:03.756149'),(20,'blog','0004_auto_20210115_0301','2021-02-19 03:52:03.767720'),(21,'blog','0005_auto_20210115_0653','2021-02-19 03:52:03.806428'),(22,'blog','0006_delete_viewcount','2021-02-19 03:52:03.834476'),(23,'blog','0007_auto_20210207_1504','2021-02-19 03:52:03.842367'),(24,'comments','0001_initial','2021-02-19 03:52:03.861636'),(25,'comments','0002_remove_comment_parent','2021-02-19 03:52:03.965678'),(26,'comments','0003_comment_parent','2021-02-19 03:52:03.985572'),(27,'comments','0004_comment_root','2021-02-19 03:52:04.032947'),(28,'sessions','0001_initial','2021-02-19 03:52:04.070284'),(29,'tag','0001_initial','2021-02-19 03:52:04.104043'),(30,'tag','0002_auto_20210128_1101','2021-02-19 03:52:04.220100'),(31,'tag','0003_auto_20210201_0937','2021-02-19 03:52:04.294638'),(32,'tag','0004_auto_20210201_1253','2021-02-19 03:52:04.310860'),(33,'tag','0005_posttag_slug','2021-02-19 03:52:04.329455'),(34,'tag','0006_auto_20210201_1302','2021-02-19 03:52:04.346905'),(35,'users','0001_initial','2021-02-19 03:52:04.372166'),(36,'viewcount','0001_initial','2021-02-19 03:52:04.414168'),(37,'viewcount','0002_viewdetail','2021-02-19 03:52:04.455755');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0n3zb1tmyypgh5ypiciyp0op8txzd0sr','OTM2YzZjNGMxOWI4ZTM2YjAwYzY1NDUwZmYxOGQ0YWYyZmVlMmVjMzp7fQ==','2020-12-26 13:56:48.640000'),('3l11yhemdnbvw70di2t57nhgetavzw7a','NGVmYzgwNDAzM2RlN2E4Yjk4ZjljYjdjZmIwOTYxOTRmYjM5YTMxMDp7Il9jc3JmdG9rZW4iOiJxTDZPMThaM0RwUHFWbk02Z01vUHBKOHZWWHY4Ukh0S0JxZ3ZmRjFtRE9KYmpXWjBUWVhtcDAxcDdSVUxGd25RIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImVhMjIyYWFhNmRiNGJmYmVhZTcyYTljNjU5MDlkYzg3NDBhZmFlNWEifQ==','2021-03-05 02:33:01.528000'),('4vlbzse6d652s0k3btrnr8fl1i3dg5ke','OTM2YzZjNGMxOWI4ZTM2YjAwYzY1NDUwZmYxOGQ0YWYyZmVlMmVjMzp7fQ==','2020-12-25 10:45:26.911000'),('56qpgupvsbh577fm6y6c3hk4bvnerck1','Yzk0ZGI5ZjE4YmQwYmQwN2YwZjBlOTBkN2UzYmNhMzE2OTA2ZDI0Mjp7Il9jc3JmdG9rZW4iOiI3ZzBuTE9NMWRQand4OHBxcVNXTFV4OXpta2JHcm5wYTNhamx6djhOSDB5T25oZUJmR0t6aE1DbXFpY1hvd2lvIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImVhMjIyYWFhNmRiNGJmYmVhZTcyYTljNjU5MDlkYzg3NDBhZmFlNWEifQ==','2021-02-21 04:40:26.756000'),('adgd9pxemc69ur6dcas6zojyzm6hwj1c','OTM2YzZjNGMxOWI4ZTM2YjAwYzY1NDUwZmYxOGQ0YWYyZmVlMmVjMzp7fQ==','2020-12-25 10:44:17.907000'),('at5b7tp0gkgrv1p3jzbo8hlwslkirfyl','OTM2YzZjNGMxOWI4ZTM2YjAwYzY1NDUwZmYxOGQ0YWYyZmVlMmVjMzp7fQ==','2020-12-25 10:55:51.791000'),('nkc95iuqt98g2fnlgc1tou87n7s7gwzm','OTM2YzZjNGMxOWI4ZTM2YjAwYzY1NDUwZmYxOGQ0YWYyZmVlMmVjMzp7fQ==','2020-12-25 11:15:10.043000'),('oggdeju10swzwjaaevavbfazml09olxv','OTM2YzZjNGMxOWI4ZTM2YjAwYzY1NDUwZmYxOGQ0YWYyZmVlMmVjMzp7fQ==','2020-12-25 08:33:47.508000'),('ontz48lahpxwqrfymv54t37fy994yaiw','OTM2YzZjNGMxOWI4ZTM2YjAwYzY1NDUwZmYxOGQ0YWYyZmVlMmVjMzp7fQ==','2020-12-25 11:12:52.951000'),('oo1gb6hd8v6aqe9sirrncsrqncoua41s','NjcwNTNhNGMyNDg3NGExMjAxNmM4NjgwMzFkZDY0OTkxN2IwYmQyYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjODEzMDgyZjIzNDkwNzlkOWI5NjhlYWFjNGJkN2Q3YTgwMmFjYTI5IiwiX2NzcmZ0b2tlbiI6IkZERWJKalU1SUpET1E0cVY3dTZSTDFmbEI2djUwQzVQcGQyZ2lHQWI0NkdjbUVzQlNqeW14S1VmM3lJNWRaa3YifQ==','2021-02-06 07:41:38.889000'),('s8twl3f9uz9eutxvviic2vywrdcgzx5j','ZWYyYTZiMGEzNTM2ZjZmNmMyYmFmOTQxYzFmOTM0NmY5NzgzNThjODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjODEzMDgyZjIzNDkwNzlkOWI5NjhlYWFjNGJkN2Q3YTgwMmFjYTI5In0=','2021-01-27 02:48:09.168000'),('t1uo8bw9o3em5l3a5z9egampm0ibudzz','OTM2YzZjNGMxOWI4ZTM2YjAwYzY1NDUwZmYxOGQ0YWYyZmVlMmVjMzp7fQ==','2020-12-25 11:01:56.482000'),('wdm8eqv8dmxwqo6lbe26qk6i0c9cdrj2','OTM2YzZjNGMxOWI4ZTM2YjAwYzY1NDUwZmYxOGQ0YWYyZmVlMmVjMzp7fQ==','2020-12-25 11:12:22.497000'),('xhdfru7dcd12e7905kihhkxfvkdox391','OTM2YzZjNGMxOWI4ZTM2YjAwYzY1NDUwZmYxOGQ0YWYyZmVlMmVjMzp7fQ==','2020-12-25 11:14:09.571000'),('xkvd8ewf93ezfaj36yu9z0c0lywkldgd','ZWYyYTZiMGEzNTM2ZjZmNmMyYmFmOTQxYzFmOTM0NmY5NzgzNThjODp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJjODEzMDgyZjIzNDkwNzlkOWI5NjhlYWFjNGJkN2Q3YTgwMmFjYTI5In0=','2021-01-22 03:17:30.940000'),('xxma40hginkpix3hhcy6u1ggi11ha9ff','OTM2YzZjNGMxOWI4ZTM2YjAwYzY1NDUwZmYxOGQ0YWYyZmVlMmVjMzp7fQ==','2020-12-25 11:01:48.756000'),('yofn4ubqjliwx3abkam9sk82uylnl3tz','OTM2YzZjNGMxOWI4ZTM2YjAwYzY1NDUwZmYxOGQ0YWYyZmVlMmVjMzp7fQ==','2020-12-25 11:11:21.286000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_posttag`
--

DROP TABLE IF EXISTS `tag_posttag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_posttag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tag_posttag_slug_9dfbf996` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_posttag`
--

LOCK TABLES `tag_posttag` WRITE;
/*!40000 ALTER TABLE `tag_posttag` DISABLE KEYS */;
INSERT INTO `tag_posttag` VALUES (1,'sql','2021-01-28 03:04:59.000000','sql'),(2,'django','2021-02-01 01:18:21.000000','django'),(3,'其它','2021-02-01 03:47:22.000000','qi-ta'),(4,'python','2021-02-01 13:19:14.000000','python'),(5,'数据结构','2021-02-01 13:20:55.000000','shu-ju-jie-gou'),(6,'算法','2021-02-01 13:49:44.000000','suan-fa');
/*!40000 ALTER TABLE `tag_posttag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag_posttag_posts`
--

DROP TABLE IF EXISTS `tag_posttag_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag_posttag_posts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `posttag_id` int NOT NULL,
  `post_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tag_posttag_posts_posttag_id_post_id_f84d394c_uniq` (`posttag_id`,`post_id`),
  KEY `tag_posttag_posts_post_id_688d37ea_fk_blog_post_id` (`post_id`),
  CONSTRAINT `tag_posttag_posts_post_id_688d37ea_fk_blog_post_id` FOREIGN KEY (`post_id`) REFERENCES `blog_post` (`id`),
  CONSTRAINT `tag_posttag_posts_posttag_id_3172615c_fk_tag_posttag_id` FOREIGN KEY (`posttag_id`) REFERENCES `tag_posttag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag_posttag_posts`
--

LOCK TABLES `tag_posttag_posts` WRITE;
/*!40000 ALTER TABLE `tag_posttag_posts` DISABLE KEYS */;
INSERT INTO `tag_posttag_posts` VALUES (5,1,65),(6,1,66),(9,1,68),(7,2,68),(8,4,68);
/*!40000 ALTER TABLE `tag_posttag_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_profile`
--

DROP TABLE IF EXISTS `users_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_profile` (
  `id` int NOT NULL AUTO_INCREMENT,
  `profile_pic` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `users_profile_user_id_2112e78d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_profile`
--

LOCK TABLES `users_profile` WRITE;
/*!40000 ALTER TABLE `users_profile` DISABLE KEYS */;
INSERT INTO `users_profile` VALUES (1,'default.jpg',1),(2,'default.jpg',17),(3,'default.jpg',18),(4,'media/profile_pics/Screen_Shot_2018-07-11_at_10.48.12_PM.png',19),(5,'default.jpg',20);
/*!40000 ALTER TABLE `users_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viewcount_viewcount`
--

DROP TABLE IF EXISTS `viewcount_viewcount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viewcount_viewcount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `count` int NOT NULL,
  `object_id` int unsigned NOT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `viewcount_viewcount_content_type_id_b96c6565_fk_django_co` (`content_type_id`),
  CONSTRAINT `viewcount_viewcount_content_type_id_b96c6565_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewcount_viewcount`
--

LOCK TABLES `viewcount_viewcount` WRITE;
/*!40000 ALTER TABLE `viewcount_viewcount` DISABLE KEYS */;
INSERT INTO `viewcount_viewcount` VALUES (11,10,25,1),(15,3,63,1),(16,4,64,1),(17,4,65,1),(18,3,66,1),(19,4,67,1),(20,0,25,1),(21,0,63,1),(22,0,64,1),(23,0,65,1),(24,0,66,1),(25,0,67,1),(26,1,68,1);
/*!40000 ALTER TABLE `viewcount_viewcount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viewcount_viewdetail`
--

DROP TABLE IF EXISTS `viewcount_viewdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viewcount_viewdetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `count` int NOT NULL,
  `object_id` int unsigned NOT NULL,
  `content_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `viewcount_viewdetail_content_type_id_66ca08a7_fk_django_co` (`content_type_id`),
  CONSTRAINT `viewcount_viewdetail_content_type_id_66ca08a7_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viewcount_viewdetail`
--

LOCK TABLES `viewcount_viewdetail` WRITE;
/*!40000 ALTER TABLE `viewcount_viewdetail` DISABLE KEYS */;
INSERT INTO `viewcount_viewdetail` VALUES (6,'2021-01-19',4,25,1),(7,'2021-01-20',1,25,1),(11,'2021-01-21',1,25,1),(14,'2021-01-21',4,64,1),(16,'2021-01-22',1,63,1),(17,'2021-01-25',1,65,1),(18,'2021-01-26',1,65,1),(19,'2021-01-26',1,66,1),(20,'2021-01-27',1,67,1),(21,'2021-01-29',1,63,1),(33,'2021-02-01',1,67,1),(47,'2021-02-04',1,67,1),(48,'2021-02-04',1,66,1),(49,'2021-02-04',1,65,1),(50,'2021-02-05',1,65,1),(51,'2021-02-05',1,63,1),(52,'2021-02-07',1,67,1),(54,'2021-02-07',1,66,1),(55,'2021-02-19',1,68,1);
/*!40000 ALTER TABLE `viewcount_viewdetail` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-19 16:55:12
