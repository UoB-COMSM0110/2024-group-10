import java.util.ArrayList;
import java.util.Collections;

class Leaderboard {
    ArrayList<ScoreEntry> entries;
    String filename = "highscores.txt"; // The file to store high scores
    int maxEntries = 5; // Max number of entries to store

    Leaderboard() {
        entries = new ArrayList<ScoreEntry>();
        loadScores();
    }

    void addScore(String name, int score) {
        if (isHighScore(score)) {
            entries.add(new ScoreEntry(name, score));
            Collections.sort(entries, Collections.reverseOrder());
            if (entries.size() > maxEntries) {
                entries.remove(entries.size() - 1); // 保留排行榜上的最高分
            }
            saveScores();  // 更新保存的分数
        }
    }


    void saveScores() {
        String[] data = new String[entries.size()];
        for (int i = 0; i < entries.size(); i++) {
            ScoreEntry entry = entries.get(i);
            data[i] = entry.name + "," + entry.score;
        }
        saveStrings(filename, data);
    }

    void loadScores() {
        String[] data = loadStrings(filename);
        if (data != null) {
            for (String line : data) {
                String[] parts = line.split(",");
                if (parts.length == 2) {
                    entries.add(new ScoreEntry(parts[0], Integer.parseInt(parts[1])));
                }
            }
        }
    }

    void display() {
        textSize(40);
        fill(255);
        for (int i = 0; i < entries.size(); i++) {
            text((i + 1) + ". " + entries.get(i).name + " ---- " + entries.get(i).score, 500, 300 + i * 50);
        }
    }

    boolean isHighScore(int score) {
    if (entries.size() < maxEntries) {
        // 如果排行榜未满，任何分数都是高分
        return true;
    } else {
        // 如果排行榜已满，分数必须大于当前最低分数
        return score > entries.get(entries.size() - 1).score;
    }
    }




    class ScoreEntry implements Comparable<ScoreEntry> {
        String name;
        int score;

        ScoreEntry(String name, int score) {
            this.name = name;
            this.score = score;
        }

        @Override
        public int compareTo(ScoreEntry other) {
            return Integer.compare(this.score, other.score);
        }
    }
}
