import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
        textTheme: GoogleFonts.interTextTheme(),
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  // 1. TopBar (Row: MainAxisAlignment.spaceBetween)
                  _buildTopBar(),
                  const SizedBox(height: 20),

                  // 2. Profile Header (Column: CrossAxisAlignment.center)
                  _buildProfileHeader(),
                  const SizedBox(height: 22),

                  // 3. Stats Card (Container > Row: Radius 20 | BoxShadow 0 8 18)
                  _buildStatsCard(),
                  const SizedBox(height: 24),

                  // 4. About Me (Column)
                  _buildAboutMe(),
                  const SizedBox(height: 24),

                  // 5. Skills & Expertise (Column > Wrap)
                  _buildSkillsAndExpertise(),
                  const SizedBox(height: 24),

                  // 6. Featured Projects (Row: 2 Expanded Cards)
                  _buildFeaturedProjects(),
                  const SizedBox(height: 24),

                  // 7. Contact Card (Container > Column: Radius 20 | Shadow 0 4 12)
                  _buildContactCard(),
                  const SizedBox(height: 36),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 1. TopBar
  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back Button: 42x42 | Radius 12 | Border #E2E8F0
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
            ),
            child: const Center(
              child: Icon(
                Icons.chevron_left_rounded,
                size: 24,
                color: Color(0xFF0F172A),
              ),
            ),
          ),
          // Title: Profile | 18px Bold | #0F172A
          Text(
            'Profile',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF0F172A),
            ),
          ),
          // Share Button: 42x42 | Radius 12 | Border #E2E8F0
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
            ),
            child: const Center(
              child: Icon(
                Icons.share_outlined,
                size: 18,
                color: Color(0xFF0F172A),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 2. Profile Header
  Widget _buildProfileHeader() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Avatar Stack (140x140 | Multi-layer)
          SizedBox(
            width: 140,
            height: 140,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Gradient Ring: 140x140 | #FFB088 -> #FF8080 -> #FFCF71
                Container(
                  width: 140,
                  height: 140,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFFFB088),
                        Color(0xFFFF8080),
                        Color(0xFFFFCF71),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                ),
                // White Border: 132x132
                Container(
                  width: 132,
                  height: 132,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
                // ClipOval > Image (Alex Rivers: 124x124)
                ClipOval(
                  child: Image.asset(
                    'assets/images/avatar.png',
                    width: 124,
                    height: 124,
                    fit: BoxFit.cover,
                  ),
                ),
                // Verified Badge: 28x28 | Blue #0284C7
                Positioned(
                  bottom: 2,
                  right: 8,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF0284C7),
                      border: Border.all(color: Colors.white, width: 2.5),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.check_rounded,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),

          // Alex Rivers | 24px w800 | #0F172A
          Text(
            'Alex Rivers',
            style: GoogleFonts.inter(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: const Color(0xFF0F172A),
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 4),

          // Lead Mobile Engineer | 15px w500 | #64748B
          Text(
            'Lead Mobile Engineer',
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF64748B),
            ),
          ),
          const SizedBox(height: 10),

          // Location Pill: Radius 20 | #F1F5F9
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 14,
                  color: Color(0xFF475569),
                ),
                const SizedBox(width: 4),
                Text(
                  'Tokyo, Japan',
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF475569),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 3. Stats Card
  Widget _buildStatsCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // 148 Projects
            _buildStatItem('148', 'Projects'),
            // Vertical Divider: 1x28 | #E2E8F0
            Container(width: 1, height: 28, color: const Color(0xFFE2E8F0)),
            // 9 Yrs Experience
            _buildStatItem('9 Yrs', 'Experience'),
            // Vertical Divider: 1x28 | #E2E8F0
            Container(width: 1, height: 28, color: const Color(0xFFE2E8F0)),
            // 4.9 ★ Rating
            _buildStatItemWithStar('4.9', 'Rating'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF0F172A),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF64748B),
          ),
        ),
      ],
    );
  }

  Widget _buildStatItemWithStar(String value, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: const Color(0xFF0F172A),
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.star_rounded,
              size: 20,
              color: Color(0xFFF59E0B),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF64748B),
          ),
        ),
      ],
    );
  }

  // 4. About Me
  Widget _buildAboutMe() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: GoogleFonts.inter(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Passionate Lead Mobile Engineer specialized in Flutter, Dart, and building high-performance cross-platform applications. Focused on elegant architecture, intuitive UX, and design systems.',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.5,
              color: const Color(0xFF475569),
            ),
          ),
        ],
      ),
    );
  }

  // 5. Skills & Expertise
  Widget _buildSkillsAndExpertise() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills & Expertise',
            style: GoogleFonts.inter(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 12),
          // Row 1: Flutter, Dart, Clean Arch
          Row(
            children: [
              _buildSkillChip(
                label: 'Flutter',
                bgColor: const Color(0xFFE0F2FE),
                textColor: const Color(0xFF0284C7),
                icon: Icons.rocket_launch_rounded,
              ),
              const SizedBox(width: 10),
              _buildSkillChip(
                label: 'Dart',
                bgColor: const Color(0xFFDCFCE7),
                textColor: const Color(0xFF16A34A),
                icon: Icons.code_rounded,
              ),
              const SizedBox(width: 10),
              _buildSkillChip(
                label: 'Clean Arch',
                bgColor: const Color(0xFFFFE4E6),
                textColor: const Color(0xFFE11D48),
                icon: Icons.pie_chart_outline_rounded,
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Row 2: UI/UX, Firebase
          Row(
            children: [
              _buildSkillChip(
                label: 'UI/UX',
                bgColor: const Color(0xFFF3E8FF),
                textColor: const Color(0xFF9333EA),
                icon: Icons.style_outlined,
              ),
              const SizedBox(width: 10),
              _buildSkillChip(
                label: 'Firebase',
                bgColor: const Color(0xFFFEF3C7),
                textColor: const Color(0xFFD97706),
                icon: Icons.local_fire_department_rounded,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip({
    required String label,
    required Color bgColor,
    required Color textColor,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: textColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  // 6. Featured Projects (Row: 2 Expanded Cards)
  Widget _buildFeaturedProjects() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Featured Projects',
            style: GoogleFonts.inter(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF0F172A),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              // Card 1: E-Shop Flutter
              Expanded(
                child: _buildProjectCard(
                  imagePath: 'assets/images/project_eshop.png',
                  title: 'E-Shop Flutter',
                  subtitle: 'Mobile App • 2024',
                ),
              ),
              const SizedBox(width: 12),
              // Card 2: Crypto Vault
              Expanded(
                child: _buildProjectCard(
                  imagePath: 'assets/images/project_crypto.png',
                  title: 'Crypto Vault',
                  subtitle: 'Finance • Clean Arch',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard({
    required String imagePath,
    required String title,
    required String subtitle,
  }) {
    return Container(
      height: 145,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image: 165x85
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              imagePath,
              height: 85,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Content: 10px padding
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 7. Contact Card (Container > Column: Radius 20 | Shadow 0 4 12)
  Widget _buildContactCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            // Row 1: Contact Information
            _buildContactRow(
              icon: Icons.alternate_email_rounded,
              title: 'Contact Information',
              isTitle: true,
            ),
            // Divider: 1px | #F1F5F9
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Divider(height: 1, thickness: 1, color: Color(0xFFF1F5F9)),
            ),
            // Row 2: alex.rivers@email.com
            _buildContactRow(
              icon: Icons.mail_outline_rounded,
              title: 'alex.rivers@email.com',
              isTitle: false,
            ),
            // Divider: 1px | #F1F5F9
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Divider(height: 1, thickness: 1, color: Color(0xFFF1F5F9)),
            ),
            // Row 3: +81 (90) 1234-5678
            _buildContactRow(
              icon: Icons.phone_outlined,
              title: '+81 (90) 1234-5678',
              isTitle: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactRow({
    required IconData icon,
    required String title,
    required bool isTitle,
  }) {
    return Row(
      children: [
        // Icon Box (34x34 | Radius 10)
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(
              icon,
              size: 18,
              color: const Color(0xFF475569),
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Text
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: isTitle ? 14 : 13,
              fontWeight: isTitle ? FontWeight.w700 : FontWeight.w500,
              color: isTitle ? const Color(0xFF0F172A) : const Color(0xFF475569),
            ),
          ),
        ),
        // Chevron Right
        const Icon(
          Icons.chevron_right_rounded,
          size: 20,
          color: Color(0xFF94A3B8),
        ),
      ],
    );
  }
}
